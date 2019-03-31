type vec2 = < x:float ; y:float > Js.t
type vec3 = < x:int ; y:int; z:int > Js.t

module rec Math:
sig
    module Euler:
    sig
      class type _euler =
        object
          method x: float [@@bs.set]
          method y: float [@@bs.set]
          method z: float [@@bs.set]
        end [@bs] 
      type t = _euler Js.t
      external make: int -> int -> int -> t = "Euler" [@@bs.new] [@@bs.module "three"] 
    end
end = Math

module rec Vector2:
sig
  class type _vector2 =
    object
      method x: float [@@bs.set]
      method y: float [@@bs.set]
      method z: float [@@bs.set]
      method addScalar: float -> Vector2.t
      method addScaledVectors: Vector2.t -> float -> Vector2.t
      method addVectors: Vector2.t -> Vector2.t -> Vector2.t
      method ceil: unit -> Vector2.t
      method clone: unit -> Vector2.t
      method distanceTo: Vector2.t -> float
    end [@bs] 
  type t = _vector2 Js.t
  external make: float -> float -> Vector2.t = "Vector2" [@@bs.new] [@@bs.module "three"] 
end = Vector2

module rec Vector3:
sig
  class type _vector3 =
    object
      method x: float [@@bs.set]
      method y: float [@@bs.set]
      method z: float [@@bs.set]
      method set: float -> float -> float -> unit
      method clone: unit -> Vector3.t
    end [@bs] 
  type t = _vector3 Js.t
  external make: int -> int -> int -> Vector3.t = "Vector3" [@@bs.new] [@@bs.module "three"] 
end = Vector3
         
module rec Object3D:
sig
  class type _object3d =
    object
      (* method children: Object3D.t Js.List *)
      method position: Vector3.t
      method rotation: Math.Euler.t
      method up: Vector3.t
      method uuid: string
      method visible: bool
      method clone: bool -> Object3D.t
      method lookAt: Vector3.t -> unit
      method userData: float Js.Dict.t [@@bs.set] [@@bs.get] 
      (* TODO: userData *)
      (* mesh or camera *)
      method add: Object3D.t -> unit
    end [@bs] 
  type t = _object3d Js.t
  external make: unit -> t = "Object3D" [@@bs.new] [@@bs.module "three"]
end = Object3D
         
module rec Group:
sig
  class type _group =
    object
      inherit Object3D._object3d
    end [@bs] 
  type t = _group Js.t
  external make: unit -> t = "Group" [@@bs.new] [@@bs.module "three"]
end = Group

module rec Camera:
sig
  class type _camera =
    object
      inherit Object3D._object3d
    end [@bs]
  type t = _camera Js.t
  module Perspective:
  sig
    external make : ?fov:float -> ?aspect:float -> ?near:float -> far:float -> t = "PerspectiveCamera" [@@bs.new] [@@bs.module "three"]
  end
end = Camera

module rec Texture:
sig
  class type _texture =
    object
      method needsUpdate: bool [@@bs.set]
                               (* TODO: add repeat set *)
    end [@bs]
  type t = _texture Js.t
end = Texture

module rec TextureLoader:
sig
  class type _TextureLoader =
    object
      (*TODO define Texture type*)
      method load: string -> Texture.t
    end [@bs]
  type t = _TextureLoader Js.t
  external make : unit -> t = "TextureLoader" [@@bs.new] [@@bs.module "three"]
end = TextureLoader
         
module rec Geometry:
sig
  class type _Geometry =
    object
      method vertices: Vector3.t Js.Array.t [@@bs.get]
    end [@bs]
  type t = _Geometry Js.t
               
  module Box:
  sig
    external make: int -> int -> int -> t = "BoxGeometry" [@@bs.new] [@@bs.module "three"] 
  end
  external make: unit -> t = "Geometry" [@@bs.new] [@@bs.module "three"] 
end = Geometry

module rec Material:
sig
  type t
  module MeshBasic:
  sig
    external make: < color: int; map: Texture.t option > Js.t -> t = "MeshBasicMaterial" [@@bs.new] [@@bs.module "three"] 
  end
  module LineBasic:
  sig
    external make: < color: int; linewidth: int > Js.t -> t = "LineBasicMaterial" [@@bs.new] [@@bs.module "three"] 
  end
  module LineDashed:
  sig
    external make: < color: int; linewidth: int; scale: int; dashSize: int; gapSize: int > Js.t -> t = "LineDashedMaterial" [@@bs.new] [@@bs.module "three"] 
  end
end = Material

module rec Line:
sig
  class type _Line =
    object
      inherit Object3D._object3d
      method computeLineDistances: unit -> unit
    end [@bs]
  type t = _Line Js.t
  module Segments:
    sig
      external make: Geometry.t -> Material.t -> Line.t = "LineSegments" [@@bs.new] [@@bs.module "three"]
    end
  external make: Geometry.t -> Material.t -> Line.t = "Line" [@@bs.new] [@@bs.module "three"]
end = Line

module rec Mesh:
sig
  class type _mesh =
    object
      inherit Object3D._object3d
                (* drawMode *)
                (* isMesh *)
      (* raycast *)
            (*
      method geometry: Geometry.t
      method material: Material.t
      method updateMorphTargets: unit -> unit
             *)
    end [@bs]
  type t = _mesh Js.t
  external rotate: Mesh.t -> Vector3.t -> float -> unit = "setRotationFromAxisAngle" [@@bs.send]
  external make: Geometry.t -> Material.t -> Mesh.t = "Mesh" [@@bs.new] [@@bs.module "three"] 
end = Mesh

module rec Scene:
sig
  class type _scene =
    object
      inherit Object3D._object3d
    end [@bs] 
  type t = _scene Js.t
  external make: unit -> Scene.t = "Scene" [@@bs.new] [@@bs.module "three"] 
  external add: t -> Mesh.t -> unit = "" [@@bs.send]
end = Scene 

module rec WebGLRenderer:
sig
  class type _webGLRenderer =
    object
      method setSize: int -> int -> unit
      method domElement: Dom.element
      method render: Scene.t -> Camera.t -> unit
    end [@bs]
  type t = _webGLRenderer Js.t
  external make: < antialias:bool > Js.t -> t = "WebGLRenderer" [@@bs.new] [@@bs.module "three"]
end = WebGLRenderer

(* *)
module rec OrbitControls:
sig
  class type _orbitcontrols =
    object
      method target: Vector3.t
      method update: unit -> unit
    end [@bs]
  type t = _orbitcontrols Js.t
  (* returns constructor *)
  external make: Camera.t -> Dom.element -> t = "dummy_new" [@@bs.new] [@@bs.module "three-orbitcontrols"]
end = OrbitControls
