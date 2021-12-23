class ProxyController < ApplicationController
  def input; end

  def view
    response = HTTParty.get("http://localhost:3000/?query=#{params[:query]}")
    body = response.body

    case params[:side]
    when 'client'
      doc = Nokogiri::XML(body)
      xslt = Nokogiri::XML::ProcessingInstruction.new(
        doc,
        'xml-stylesheet',
        'type="text/xsl" href="/client.xslt"'
      )
      doc.root.add_previous_sibling(xslt)
      render xml: doc.to_xml
    when 'server'
      doc = Nokogiri::XML(body)
      xslt = Nokogiri::XSLT(File.read("#{Rails.root}/public/server.xslt"))
      @result = xslt.transform(doc).to_html
    else
      render xml: response
    end
  end
end
