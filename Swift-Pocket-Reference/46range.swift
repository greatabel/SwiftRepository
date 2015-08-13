var r = 1...5
println(r)
println(r.startIndex)
println(r.endIndex)

println("---->")
for x in r
{
    println(x)
}

var i = 1.1...2.2
println(i.start)
print(i.end)

println(i.contains(3.4))
println(i.contains(1.6))

var s = stride(from:2, to:18, by:2) 
for x in s 
{
println (x) 
}

for x in stride(from:2.2, through:2.8, by:0.3) {
println (x) 
}