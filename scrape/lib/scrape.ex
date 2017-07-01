defmodule Scrape do
  @moduledoc """
  Documentation for Scrape.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Scrape.hello
      :world

  """
  def main do
    res= HTTPoison.get!("https://github.com/gericass").body 
          |> Floki.find("span.Counter") 
          |> Enum.at(2) 
          |> Floki.text() 
          |> String.strip()
    IO.puts res 
  end
end
