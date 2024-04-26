module AtpSchemas
  class SchemaCheckerErrorHandler
    import "java"
    include org.xml.sax.ErrorHandler

    def initialize
      @sax_errors = []
    end

    java_signature "void warning(org.xml.sax.SAXParseException exception) throws org.xml.sax.SAXException"
    def warning(sax_exception)
      @sax_errors << sax_exception
    end

    java_signature "void error(org.xml.sax.SAXParseException exception) throws org.xml.sax.SAXException"
    def error(sax_exception)
      @sax_errors << sax_exception
    end

    java_signature "void fatalError(org.xml.sax.SAXParseException exception) throws org.xml.sax.SAXException"
    def fatalError(sax_exception)
      @sax_errors << sax_exception
    end

    def errors
      @sax_errors.map do |s_error|
        "#{s_error.getSystemId()}:#{s_error.getLineNumber()}:#{s_error.getColumnNumber()}\n#{s_error.getMessage()}"
      end
    end
  end

  class SchemaCheckerResourceLoader
    import "java"
    include org.w3c.dom.ls.LSResourceResolver
  end

  class SchemaChecker
    import "java"
    import javax.xml.XMLConstants
    import javax.xml.validation.SchemaFactory
    import javax.xml.transform.stream.StreamSource
    import java.io.File

    def self.validate_schema(schema_path)
      eh = SchemaCheckerErrorHandler.new
      rr = SchemaCheckerResourceLoader.new
      sf = SchemaFactory.newInstance(XMLConstants::W3C_XML_SCHEMA_NS_URI)
      file = File.new(schema_path)
      source = StreamSource.new(file)
      sf.setErrorHandler(eh)
      sf.newSchema(source)
      eh
    end
  end
end
