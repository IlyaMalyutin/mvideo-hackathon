Run docker:

```
jupyter_port=8080
tensorboard_port=6000
data_dir=data/
# src_dir=/Users/ilya/projects/mvideo-hackathon/src
src_dir=/home/ilya/projects/mvideo-hackathon/

# push image 
docker push solino/tensorflo

#develop mode:
docker run -it -p $jupyter_port:8080 -p $tensorboard_port:6000 -v $src_dir:/app solino/tensorflow

#run task mode:
docker run -it -p $jupyter_port:8080 -p $tensorboard_port:6000 -v $data_dir:/app/data/ solino/tensorflow [task]
```