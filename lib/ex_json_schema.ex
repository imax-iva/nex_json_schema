defmodule NExJsonSchema do
  @type json_value :: nil | true | false | list | float | integer | String.t() | %{}
  @type json :: %{String.t() => json_value}
  @type data :: json | json_value
end
