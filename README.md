# BuildEach

A proxy for GitHub push events that replays the push for each commit, changing
the effective `HEAD`.

The goal of this project is to emulate to the push receiver pushing each commit
individually, instead of in batch so that it reacts to each commit instead of
just to the effective `HEAD`. For example, I built this to force Travis to run
the tests for every pushed commit, instead of just for the tip of the branch.

## Using

Change the URL of your push notification (or the **Domain** field in Travis
service) in GitHub from `https://my-upstream-url.com/foo/bar` to
`http://build-each.herokuapp.com/build?url=https%3A%2F%2Fmy-upstream-url.com%2Ffoo%2Fbar`.

## License

The MIT License (MIT)
Copyright © 2014 Bo Jeanes <me@bjeanes.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
