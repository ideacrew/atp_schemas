# ATP Schemas

Contains extended schemas, examples, and validators for the ATP protocol.

This application consists of 3 parts:
1. The schemas themselves, under the XSD directory
2. A schema validator, that ensures the extensions to the schema are themselves valid and allowed, called `atp_schema_validator`.  This can be tested using `mvn clean && mvn test`.
3. A set of examples which are executed against the extended schema to ensure the example is valid, called `atp_schema_examples`.  This can be tested using `bundle exec rspec`.
