part of streetlib;

Camera _camera = new Camera._();
class Camera {
  int x,y;
  double zoom;
  
  factory Camera() {
    _camera.x = 0;
    _camera.y = 0;
    _camera.zoom = 1.0;
    return _camera;
  }
  set( x, y,{zoom :1.0}) {
    this.x = x;
    this.y = y;
    this.zoom = zoom;
  }
  
  Camera._();
}