### Step 1.

Open your project.

### Step 2.

Open Info.plist as source code (right click) of your project.

### Step 3.

Before (look for end of file)

```xml
</dict>
</plist>
```

Insert following

```xml
<code class="xml">
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
</code>
```