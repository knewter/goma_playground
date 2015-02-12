defmodule GomaHelloWorld do
  require Record
  Record.defrecordp :goma_selector, Record.extract(:goma_selector, from_lib: "goma/include/goma.hrl")

  def init(args) do
    {:ok, args}
  end

  def resource_exists(_selector, context) do
    {true, context}
  end

  def produce_content(selector, context) do
    content = "Hello #{goma_selector(selector)[:raw]} World!"
    {{:text, content}, context}
  end
end
