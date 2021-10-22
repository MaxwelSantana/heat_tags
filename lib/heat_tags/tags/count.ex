defmodule HeatTags.Tags.Count do
  alias HeatTags.Messages.Get

  def call do
    messages = Get.today_messages()

    Task.async_stream(messages, fn message ->
      message.message
      |> String.split()
      |> Enum.frequencies()
    end)
    |> Enum.reduce(%{}, fn elem, acc -> sum_values(elem, acc) end)
  end

  defp sum_values({:ok, map1}, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end
end
