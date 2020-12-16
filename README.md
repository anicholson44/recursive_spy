# Recursive Spy

If you have ever found yourself wondering, "What type of object is being passed around here? What are its public methods?", RecursiveSpy might be able to help.

If you are in the unfortunate position of having to write a retroactive unit test, you can pass a RecursiveSpy to a method under test and investigate what gets done to it. Sometimes, seeing what public methods get called on an object can help you figure out what the heck type of object it is.

This is a very naive implementation at this point. Please contribute or create an issue if you find shortcomings.