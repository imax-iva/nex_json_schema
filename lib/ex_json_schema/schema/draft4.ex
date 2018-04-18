defmodule NExJsonSchema.Schema.Draft4 do
  @schema %{
    "$schema" => "http://json-schema.org/draft-04/schema#",
    "default" => %{},
    "definitions" => %{
      "positiveInteger" => %{"minimum" => 0, "type" => "integer"},
      "positiveIntegerDefault0" => %{"allOf" => [%{"$ref" => "#/definitions/positiveInteger"}, %{"default" => 0}]},
      "schemaArray" => %{"items" => %{"$ref" => "#"}, "minItems" => 1, "type" => "array"},
      "simpleTypes" => %{"enum" => ["array", "boolean", "integer", "null", "number", "object", "string"]},
      "stringArray" => %{"items" => %{"type" => "string"}, "minItems" => 1, "type" => "array", "uniqueItems" => true}
    },
    "dependencies" => %{"exclusiveMaximum" => ["maximum"], "exclusiveMinimum" => ["minimum"]},
    "description" => "Core schema meta-schema",
    "id" => "http://json-schema.org/draft-04/schema#",
    "properties" => %{
      "$schema" => %{"format" => "uri", "type" => "string"},
      "additionalItems" => %{"anyOf" => [%{"type" => "boolean"}, %{"$ref" => "#"}], "default" => %{}},
      "additionalProperties" => %{"anyOf" => [%{"type" => "boolean"}, %{"$ref" => "#"}], "default" => %{}},
      "allOf" => %{"$ref" => "#/definitions/schemaArray"},
      "anyOf" => %{"$ref" => "#/definitions/schemaArray"},
      "default" => %{},
      "definitions" => %{"additionalProperties" => %{"$ref" => "#"}, "default" => %{}, "type" => "object"},
      "dependencies" => %{
        "additionalProperties" => %{"anyOf" => [%{"$ref" => "#"}, %{"$ref" => "#/definitions/stringArray"}]},
        "type" => "object"
      },
      "description" => %{"type" => "string"},
      "enum" => %{"minItems" => 1, "type" => "array", "uniqueItems" => true},
      "exclusiveMaximum" => %{"default" => false, "type" => "boolean"},
      "exclusiveMinimum" => %{"default" => false, "type" => "boolean"},
      "id" => %{"format" => "uri", "type" => "string"},
      "items" => %{"anyOf" => [%{"$ref" => "#"}, %{"$ref" => "#/definitions/schemaArray"}], "default" => %{}},
      "maxItems" => %{"$ref" => "#/definitions/positiveInteger"},
      "maxLength" => %{"$ref" => "#/definitions/positiveInteger"},
      "maxProperties" => %{"$ref" => "#/definitions/positiveInteger"},
      "maximum" => %{"type" => "number"},
      "minItems" => %{"$ref" => "#/definitions/positiveIntegerDefault0"},
      "minLength" => %{"$ref" => "#/definitions/positiveIntegerDefault0"},
      "minProperties" => %{"$ref" => "#/definitions/positiveIntegerDefault0"},
      "minimum" => %{"type" => "number"},
      "multipleOf" => %{"exclusiveMinimum" => true, "minimum" => 0, "type" => "number"},
      "not" => %{"$ref" => "#"},
      "oneOf" => %{"$ref" => "#/definitions/schemaArray"},
      "pattern" => %{"format" => "regex", "type" => "string"},
      "patternProperties" => %{"additionalProperties" => %{"$ref" => "#"}, "default" => %{}, "type" => "object"},
      "properties" => %{"additionalProperties" => %{"$ref" => "#"}, "default" => %{}, "type" => "object"},
      "required" => %{"$ref" => "#/definitions/stringArray"},
      "title" => %{"type" => "string"},
      "type" => %{
        "anyOf" => [
          %{"$ref" => "#/definitions/simpleTypes"},
          %{
            "items" => %{"$ref" => "#/definitions/simpleTypes"},
            "minItems" => 1,
            "type" => "array",
            "uniqueItems" => true
          }
        ]
      },
      "uniqueItems" => %{"default" => false, "type" => "boolean"}
    },
    "type" => "object"
  }

  @spec schema() :: NExJsonSchema.json()
  def schema, do: @schema
end
