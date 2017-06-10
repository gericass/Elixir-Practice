#実行は $iex test.exs
#$elixir test.exs でも実行可能

defmodule Test do
    def put(n), do: (
        IO.puts n
        IO.puts n <> "kirei" #文字列(バイナリ)の連結
        IO.puts "#{n} kirei"
    )

    def match(n), do: (
        a = n
        IO.puts a
    )

    def map(), do: ( #map
        mp = %{"ohana"=>"kirei","ore"=>"not kirei"}
        mp2 = %{ohana: "kirei", ore: "not kirei"}
        IO.puts mp["ohana"]
        IO.puts mp2.ohana
        IO.puts mp2[:ore]
    )
end

defmodule Params do
    def func(p1,p2 \\123) #引数 \\ デフォルト値

    def func(p1,p2) when is_list(p1) do
        "You said #{p2} with a list"
    end

    def func(p1,p2) do
        "You passed in #{p1} and #{p2}"
    end

    def asa() do
        import Test, only: [put: 1] #import モジュール名, only: [関数名: 引数の数]
        put "ohana ha"
    end
end


sum = fn (a,b) -> a+b end #無名関数。Pythonで言う所のlambda　呼び出しは$ sum.(1,2)