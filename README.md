# A simple Elixir web server base project using only Plug and Cowboy.

## Basic usage

After cloning the repo, go the project directory:

```
cd elixir_webserver_base
```

Fetch dependencies and compile:

```
mix do deps.get, compile
```

Run the application:

```
PORT=8765 mix run --no-halt
```

If `PORT` is not specified, the application will use port 8000.

## Notes

The only external dependencies of this project are Plug (`~> 1.5`)and Cowboy (`~> 1.1`).  The available `GET` routes for the HTTP servers are:

* `/`  Prints static text.

* `/hello` Prints static text.

* `/hello/:name`  Prints a message with the given `:name`.

A message with the current UTC time is appended to all responses.

The supervised application is defined in `lib/elixir_webserver_base/application.ex`.  But this is mostly boilerplate.  The substance of the app is in the handling of routing and responses, located in `lib/elixir_webserver_base/router.ex`.
