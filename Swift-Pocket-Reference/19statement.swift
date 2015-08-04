outerloop: for var i=1; i<10; i++ {
    for var j=1; j<10; j++ 
    {
    if((i==6)&&((i*j)>=30)) 
        { continue outerloop }
    print ("@i=\(i) # \(i * j) |") 
    }

    println ("-") 
}