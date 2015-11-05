defmodule MacroAuthError do
  defexception [:message]
end

defmodule H do
  require IEx
  def on_def(env, kind, name, args, guards, body) do
    IO.puts "Defining #{kind} named #{name} with args:"
    IO.inspect args
    IO.puts "and guards"
    IO.inspect guards
    IO.puts "and body"
    IO.inspect body
    complain_unless_starts_with_auth(env, args, body)
  end

  def complain_unless_starts_with_auth(env, [{_, meta, _}], body) do
    line = Dict.get(meta, :line)
    IO.puts "co"
    expr = get_first_line(body)
    case expr do
      {{:., _, [{:__aliases__, _, [:M, :Auth]}, _]}, _, _} -> :ok
      _ -> raise MacroAuthError, message: "Function must begin with a call to M.Auth, sucker.  Check line #{line} in file #{env.file}"
    end
  end

  def get_first_line({:__block__, _, expr_list}) do
    IO.puts "ge"
    hd(expr_list)
  end
  def get_first_line(expr) do
    IO.puts "g2"
    expr
  end
end
