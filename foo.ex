defmodule M.Auth do
  def foo(1) do
    :ok
  end

  def bar do
    :ok
  end
end

defmodule M do
  @on_definition {H, :on_def}

  def hello(arg) when is_binary(arg) or is_list(arg) do
    M.Auth.foo(1)
    :ok
    M.Auth.bar
  end

  def hello(_) do
    :ok
  end
end
