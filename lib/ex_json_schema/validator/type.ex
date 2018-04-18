defmodule NExJsonSchema.Validator.Type do
  alias NExJsonSchema.Validator

  @spec validate(String.t(), NExJsonSchema.data()) :: Validator.errors_with_list_paths()
  def validate(type, data) do
    case valid?(type, data) do
      true ->
        []

      false ->
        [
          {%{
             description: "type mismatch. Expected #{type |> type_name} but got #{data |> data_type |> type_name}",
             rule: :cast,
             params: [type]
           }, []}
        ]
    end
  end

  defp valid?(type, data) when is_list(type) do
    Enum.any?(type, &valid?(&1, data))
  end

  defp valid?(type, data) do
    case type do
      "null" -> is_nil(data)
      "boolean" -> is_boolean(data)
      "string" -> is_binary(data)
      "integer" -> is_integer(data)
      "number" -> is_number(data)
      "array" -> is_list(data)
      "object" -> is_map(data)
    end
  end

  defp data_type(data) do
    cond do
      is_nil(data) -> "null"
      is_boolean(data) -> "boolean"
      is_binary(data) -> "string"
      is_integer(data) -> "integer"
      is_number(data) -> "number"
      is_list(data) -> "array"
      is_map(data) -> "object"
    end
  end

  defp type_name(type) do
    type
    |> List.wrap()
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(", ")
  end
end
