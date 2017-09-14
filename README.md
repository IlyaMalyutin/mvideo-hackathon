Run docker:

```
jupyter_port=8080
tensorboard_port=6000
data_dir=data/
src_dir=src/

#develop mode:
docker run -it -p $jupyter_port:8080 -p $tensorboard_port:6000 -v /Users/ilya/projects/mvideo-hackathon/:/app solino/tensorflow

#run task mode:
docker run -it -p $jupyter_port:8080 -p $tensorboard_port:6000 -v $data_dir:/app/data/ solino/tensorflow [task]
```