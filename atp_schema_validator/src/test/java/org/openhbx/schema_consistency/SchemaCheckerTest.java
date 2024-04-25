package org.openhbx.schema_consistency;

import org.openhbx.schema_consistency.test_utilities.xml.ErrorHandler;
import junit.framework.Assert;
import org.junit.Test;

/**
 *
 * @author tevans
 */
public class SchemaCheckerTest {
  
  public SchemaCheckerTest() {
  }
  
  @Test
  public void CheckConstraintTest() throws Exception {
    checkSchema("constraint", "/exchange/ExchangeModel.xsd");
  }
  
  @Test
  public void CheckUnconstrainedTest() throws Exception {
    checkSchema("unconstrained", "/exchange/SBM.xsd");
  }

  private void checkSchema(String path, String schemaName) throws Exception {
    SchemaChecker sc = new SchemaChecker();
    ErrorHandler er = sc.validateSchema(path, schemaName);
    Assert.assertTrue(er.getErrors().isEmpty());
  }
}
