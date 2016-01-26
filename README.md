Supported tags and respective `Dockerfile` links
================================================

 - [`0.166001`,&nbsp;`0.163000`,&nbsp;`0.162000`,&nbsp;`latest`&nbsp;*(Dockerfile)*][1]
 - [`onbuild`&nbsp;*(onbuild/Dockerfile)*][2]

How to use this image
=====================

Create a `Dockerfile` in your Dancer app project
------------------------------------------------

    FROM sherwind/dancer:onbuild
    
    # comment out to use development environment
    ENV DANCER_ENVIRONMENT production

You can then build and run the Docker image:

    docker build -t my-dancer-app .
    docker run -it --rm --name my-running-app -p 5000:5000 my-dancer-app

You can test it by visiting `http://localhost:5000` in a browser. If you are using `boot2docker` on Mac OS X, use OS X's `open` command to test it instead:

    open http://$(boot2docker ip 2>/dev/null):5000

### Generate a `cpanfile.snapshot`

The `onbuild` tag assumes that your application is using [Carton][3] to manage its dependencies and both `cpanfile` and `cpanfile.snapshot` files exist in your app directory.  To generate a `cpanfile.snapshot`, you can run `carton install` by using the Dancer Docker image directly:

    docker run -it --rm -v "$PWD":/usr/src/app -w /usr/src/app sherwind/dancer carton install

Bootstrap a new Dancer application
----------------------------------

If you want to generate the scaffolding for a new Dancer project, you can do the following:

    docker run -it --rm -v "$PWD":/usr/src/app -w /usr/src/app sherwind/dancer dancer2 -a MyWebApp

This will create a sub-directory named `MyWebApp` inside your current directory.


  [1]: https://github.com/sherwind/docker-dancer/blob/master/Dockerfile
  [2]: https://github.com/sherwind/docker-dancer/blob/master/onbuild/Dockerfile
  [3]: https://metacpan.org/pod/Carton
