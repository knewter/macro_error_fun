# Macro to catch compile time errors of an app-specific sort

We want to know if we failed to call a function from a given module at the
beginning of all of the functions in another module.  This defines a macro with
an `@on_define` that does that.

```sh
elixirc macro.ex
elixirc -pa . foo.ex
```
