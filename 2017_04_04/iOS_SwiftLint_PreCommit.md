#### Pre-commit script for iOS projects for automated code review

##### Step 1. Navigate to project directory using terminal

Example

```sh
cd ~/myProjectsFolder/XYZProjectGitCheckout/
```

##### Step 2. Further navigate to `.git` folders

Example

```sh
cd .git/
```

You must have `.git` folder inside your local check-out. If it's not there, you must be at wrong place.

##### Step 3. Check if `hooks` folder exists or not. If not create one and move inside that folder.



```sh
mkdir .hooks # optional step
cd .hooks
```

##### Step 4. Make sure that you're at valid directory.

```sh
pwd
# output should be as follows
# ~/myProjectsFolder/XYZProjectGitCheckout/.git/hooks
```

##### Step 5. Create a file named `pre-commit`

(Yes. Without any extension)
and put following contents inside that file.

```sh
count=`swiftlint lint --enable-all-rules --quiet | wc -l | awk '{print $1}' | bc`

if [ $count -gt 0 ]
then
        echo "Please correct swift-lint errors"
        echo "\n--------------------------------\n"
        swiftlint lint --quiet
        exit 1
else
        echo "Code quality check done."
        echo "\nThank you for keeping the code clean."
        echo "\nCommiting code"
        exit 0
fi
```

##### Step 6. Apply executable permissions.

```sh
chown 777 pre-commit

# Example output
# total 16
# drwxr-xr-x   4 sagar  Other Users	136 Apr  4 12:29 .
# drwxr-xr-x  12 sagar  Other Users	408 Apr  4 12:19 ..
# -rwxr-xr-x   1 sagar  Other Users	177 Apr  4 11:42 README.sample
# -rwxrwxrwx   1 sagar  Other Users	300 Apr  4 12:29 pre-commit
```

##### Step 7. Try to commit the code. In my case it shows following errors because code in not well organized.

```sh
sagar (master +) ADemoProject $ git commit -m "Removing files a b c"

Please correct swift-lint errors

--------------------------------

/Users/sagar/Desktop/ADemoProject/ADemoProject/ViewController.swift:23: warning: Vertical Whitespace Violation: Limit vertical whitespace to a single empty line. Currently 2. (vertical_whitespace)
/Users/sagar/Desktop/ADemoProject/ADemoProject/ViewController.swift:25: warning: Trailing Newline Violation: Files should have a single trailing newline. (trailing_newline)
```

