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

    def map2(person) do #heightというキーを持ったmapの受け取り
        IO.puts "#{person.height}"
    end

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

defmodule Maplist do #再帰的なリスト処理 $ Maplist.map([1,2,3,4,5],fn (n) -> n*2 end)
    def map([],_func), do: []
    def map([head | tail], func), do: [func.(head) | map(tail,func)]
end


defmodule MyList do # MyList.sum([1,2,3,4,5],0)
    def sum([],total), do: total
    def sum([head|tail],total), do: sum(tail,total+head)
end

defmodule MyListPrivate do #$ MyListPrivate.sum([1,2,3,4,5])
    def sum(list), do: _sum(list,0)

    defp _sum([],total), do: total
    defp _sum([head|tail],total), do: _sum(tail,total+head)
end


defmodule FB do
    def fizzbuzz(0,0,_), do: (
        IO.puts "fizzbuzz" 
    )
    def fizzbuzz(0,_,_), do: (
        IO.puts "fizz"
    )
    def fizzbuzz(_,0,_), do: (
        IO.puts "buzz" 
    )
    def fizzbuzz(_,_,x), do: (
        IO.puts x 
    )

    def setList([head|tail]), do: _setList([head|tail],head)

    defp _setList([0|tail],_), do: [0|tail]
    defp _setList(list,n), do: _setList([n-1|list],n-1)
end


defmodule Canvas do
    @defaults [ fg: "black", bg: "white", font: "Merriweather"]

    def draw_text(text,options\\[]) do #Canvas.draw_text("hello",fg: "red",style: "italic", style: "bold")
        options = Keyword.merge(@defaults,options)
        IO.puts "Drawing text #{inspect(text)}"
        IO.puts "Foreground #{options[:fg]}"
        IO.puts "Background: #{Keyword.get(options, :bg)}"
        IO.puts "pattern #{Keyword.get(options, :font)}"
        IO.puts "Style: #{inspect Keyword.get_values(options, :style)}"
    end
end

defmodule Subscriber do #構造体の定義
    defstruct name: "", paid: false, over_18: true 
    #s1 = %Subscriber{}
    #s2 = %Subscriber{name: "Dave"} 
end

defmodule Customer do
    defstruct name: "", company: ""
end

defmodule BugReport do
    defstruct owner: %Customer{}, details: "", severity: 1
    #report = %BugReport{owner: %Customer{name: "Dave", company: "Pragmatic"},details: "broken"}
    #put_in(report.owner.company, "PragProg") 構造体in構造体の値の書き換え
end

sum = fn (a,b) -> a+b end #無名関数。Pythonで言う所のlambda　呼び出しは$ sum.(1,2)

#m = %{a: 1,b: 2,c: 5}
#m1 = %{m|b: 9,c: 18} マップの更新

#for x <- [1,2,3,4,5], do: x*x 内包表記
#for x <- [1,2], y <- [5,6] do: x*y 二重for文的