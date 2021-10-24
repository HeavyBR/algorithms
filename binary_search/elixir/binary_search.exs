defmodule BinarySearch do
  @moduledoc """
  This implementation is just for educational purposes, Elixir uses linked lists as their list implementation,
  so do binary search on that type of list is not a good idea because we have a O(n) time access on random elements.
  """

  def search(list, item) do
    high = length(list) - 1
    low = 0

    binary_search(list, item, high, low)
  end

  defp binary_search(_, item, high, low) when low > high, do: "Item #{item} is not present on the list."

  defp binary_search(list, item, high, low) do
    mid = div(high + low, 2)

    guess =
      list
      |> Enum.at(mid)

    cond do
      guess == item -> mid
      guess > item -> binary_search(list, item, mid - 1, low)
      true -> binary_search(list, item, high, mid + 1)
    end
  end
end


list = [1, 3, 5, 7, 9]

IO.puts(BinarySearch.search(list, 7))
