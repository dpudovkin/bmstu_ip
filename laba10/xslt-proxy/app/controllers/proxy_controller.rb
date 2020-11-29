# frozen_string_literal: true
require 'open-uri'

class ProxyController < ApplicationController

  before_action :parse_params, only: :output
  before_action :prepare_url, only: :output

  def input; end

  # side:
  # 1. возвращает XML в неизменном виде;
  # 2. превращает XML в HTML на стороне сервера (средствами Ruby);
  # 3. превращает XML в HTML на стороне браузера.
  def output
    @hash = Hash.from_xml(open(@url))
    api_response = open(@url)


    case @side
    when 'server'
      # @hash_result = Hash.from_xml(api_response)
      @result = xslt_transform(api_response).to_html
    when 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    else
      render xml: api_response
    end

  end

  private


  BASE_API_URL           = 'http://localhost:3000/?format=xml'.freeze
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/server_transform.xslt".freeze
  XSLT_BROWSER_TRANSFORM = '/server_transform.xslt'.freeze

  def parse_params
    @number = params[:number]
    @side = params[:side]
  end

  def prepare_url
    @url = BASE_API_URL + "&number=#{@number}"
  end

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet',
                                                    'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
