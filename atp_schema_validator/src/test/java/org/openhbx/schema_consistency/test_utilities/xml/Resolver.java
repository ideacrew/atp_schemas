package org.openhbx.schema_consistency.test_utilities.xml;

import java.io.InputStream;
import java.io.Reader;
import java.net.URI;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.w3c.dom.ls.LSInput;
import org.w3c.dom.ls.LSResourceResolver;

/**
 *
 * @author tevans
 */
public class Resolver implements LSResourceResolver {
    
    private final String defaultBaseURI;
    private final String resolveBaseURI;
    
    public Resolver(String path) {
        this.resolveBaseURI = "/org/openhbx/atp_schema/xsds/" + path;
        this.defaultBaseURI = "/org/openhbx/atp_schema/xsds/" + path + "/exchange/";
    }

    @Override
    public LSInput resolveResource(String type, String namespaceURI, String publicId, String systemId, String baseURI) {
      String lookupPlace = this.defaultBaseURI;
      if (baseURI != null) {
          String previousBaseUri = Paths.get(URI.create(baseURI)).getParent().toUri().getPath();
          lookupPlace = Paths.get(resolveBaseURI, previousBaseUri).toUri().getPath();
      }
      Path resourcePath = Paths.get(lookupPlace).resolve(systemId).normalize();
      String lookupLocation = resourcePath.toUri().getPath();
      InputStream fileStream = this.getClass().
            getClassLoader().
            getResourceAsStream(lookupLocation.replaceFirst("/", ""));
      return new ResolvedSchemaInput(publicId, lookupLocation.replaceFirst(this.resolveBaseURI, ""), "", fileStream);
    }
  
  public class ResolvedSchemaInput implements LSInput {

    private final String systemId;
    private final String baseUri;
    private final String publicId;
    private final InputStream byteStream;
    
    public ResolvedSchemaInput(String pId, String sId, String bUri, InputStream iStream) {
      publicId = pId;
      systemId = sId;
      baseUri = bUri;
      byteStream = iStream;
    }
    
    @Override
    public Reader getCharacterStream() {
      return null;
    }

    @Override
    public void setCharacterStream(Reader characterStream) {
    }

    @Override
    public InputStream getByteStream() {
      return byteStream;
    }

    @Override
    public void setByteStream(InputStream byteStream) {
    }

    @Override
    public String getStringData() {
      return null;
    }

    @Override
    public void setStringData(String stringData) {
      throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getSystemId() {
      return systemId;
    }

    @Override
    public void setSystemId(String systemId) {
    }

    @Override
    public String getPublicId() {
      return publicId;
    }

    @Override
    public void setPublicId(String publicId) {
    }

    @Override
    public String getBaseURI() {
      return baseUri;
    }

    @Override
    public void setBaseURI(String baseURI) {
    }

    @Override
    public String getEncoding() {
      return null;
    }

    @Override
    public void setEncoding(String encoding) {
    }

    @Override
    public boolean getCertifiedText() {
      return false;
    }

    @Override
    public void setCertifiedText(boolean certifiedText) {
    }
    
  }
}