# 70. If, for, slices


## Tasks 
### 1. Bank
Create a simple bank application. <br>
Running the application should show a menu with 4 options: 
```
	    1. Deposit
		2. Withdraw
		3. Check balance
		4. Exit
```

use thi example to get the user input: 
```
var choice int
fmt.Scanln(&choice)
switch choice {
```
use `for` loop to display the menu indefinetly.