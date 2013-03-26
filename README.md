Example json2java Generator using cog
=====================================

This simple project demonstrates how to use [cog][] to generate Java classes from
data stored in json files.

To play with this example install cog

```
$ gem install cog
```

edit the `json/sample.json` file and re-run the generator to update `src/Sample.java`

```
$ cog gen
```

The code which reads the JSON and writes the Java file is located in `cog/generators/json2java.rb`. It makes use of an ERB template located in `cog/templates/javaClass.java.erb`

[cog]: https://github.com/ktonon/cog
