module AtpSchemaExamples
  class DocumentValidationSuccess
    def errors; []; end
  end

  class DocumentValidationFailure
    attr_reader :errors

    def initialize(errors)
      @errors = errors
    end
  end

  class Validator
    def initialize(schema)
      @schema = schema
    end

    def validate(document)
      val_result = @schema.validate(document)
      return DocumentValidationSuccess.new if val_result.nil? || val_result.empty?
      DocumentValidationFailure.new(val_result)
    end
  end
end
