(* bs-webapi *)
open Webapi

module rec Euler:
sig
  class type _euler =
    object
      method x: float [@@bs.set]
      method y: float [@@bs.set]
      method z: float [@@bs.set]
    end [@bs]
  type t = _euler Js.t
  external make: float ->
                 float ->
                 float ->
                 string ->
                 t = "Euler" [@@bs.new] [@@bs.module "three"]
end = Euler

module rec Matrix3:
sig
  class type _matrix3 =
    object
      method set: float -> float -> float ->
                  float -> float -> float ->
                  float -> float -> float -> Matrix3.t
    end [@bs]
  type t = _matrix3 Js.t
  external make: unit -> t = "Matrix3" [@@bs.new] [@@bs.module "three"]
end = Matrix3

module rec Vector2:
sig
  class type _vector2 =
    object
      method height: float [@@bs.set]
      method width: float [@@bs.set]
      method x: float [@@bs.set]
      method y: float [@@bs.set]

      method add: Vector2.t -> Vector2.t
      method addScalar: float -> Vector2.t
      method addScaledVectors: Vector2.t -> float -> Vector2.t
      method addVectors: Vector2.t -> Vector2.t -> Vector2.t
      method angle: unit -> float
      method applyMatrix3: Matrix3.t -> Vector2.t
      method ceil: unit -> Vector2.t
      method clamp: Vector2.t -> Vector2.t -> Vector2.t
      method clampLength: float -> float -> Vector2.t
      method clampScalar: float -> float -> Vector2.t
      method clone: unit -> Vector2.t
      method copy: Vector2.t -> Vector2.t
      method distanceTo: Vector2.t -> float
      method manhattanDistanceTo: Vector2.t -> float
      method distanceToSquared: Vector2.t -> float
      method divide: Vector2.t -> Vector2.t
      method divideScalar: float -> Vector2.t
      method dot: Vector2.t -> float
      method cross: Vector2.t -> float
      method equals: Vector2.t -> bool
      method floor: Vector2.t -> Vector2.t
      (* method fromArray: *)
      (* method fromBufferAttribute: *)
      method getComponent: int -> float
      method length: unit -> float
      method manhattanLength: unit -> float
      method lengthSq: unit -> float
      method lerp: Vector2.t -> float -> Vector2.t
      method lerpVectors: Vector2.t -> Vector2.t -> float -> Vector2.t
      method negate: unit -> Vector2.t
      method normalize: unit -> Vector2.t
      method max: Vector2.t -> Vector2.t
      method min: Vector2.t -> Vector2.t
      method multiply: Vector2.t -> Vector2.t
      method multiplyscalar: float -> Vector2.t
      method rotateAround: Vector2.t -> float -> Vector2.t
      method round: unit -> Vector2.t
      method roundToZero: unit -> Vector2.t
      method set: float -> float -> Vector2.t
      method setComponent: int -> float -> unit
      method setLength: float -> Vector2.t
      method setscalar: float -> Vector2.t
      method setX: float -> Vector2.t
      method setY: float -> Vector2.t
      method sub: Vector2.t -> Vector2.t
      method subScalar: float -> Vector2.t
      method subVectors: Vector2.t -> Vector2.t -> Vector2.t
      (* method toArray *)
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

      method add: Vector3.t -> Vector3.t
      method addScalar: float -> Vector3.t
      method addScaledVector: Vector3.t -> float -> Vector3.t
      method addVectors: Vector3.t -> Vector3.t -> Vector3.t
      method applyAxisAngle: Vector3.t -> float -> Vector3.t
      method applyEuler: Euler.t -> Vector3.t
      method applyMatrix3: Matrix3.t -> Vector3.t
      (* applyMatrix4 *)
      method applyNormalMatrix: Matrix3.t -> Vector3.t
      (* method applyQuaternion *)
      method angleTo: Vector3.t -> float
      method ceil: Vector3.t
      method clamp: Vector3.t -> Vector3.t -> Vector3.t
      method clampLength: float -> float -> Vector3.t
      method clampScalar: float -> float -> Vector3.t
      method clone: unit -> Vector3.t
      method copy: Vector3.t -> Vector3.t
      method cross: Vector3.t -> Vector3.t
      method crossVectors: Vector3.t -> Vector3.t -> Vector3.t
      method distanceTo: Vector3.t -> float
      method manhattanDistanceTo: Vector3.t -> float
      method distanceToSquared: Vector3.t -> float
      method divide: Vector3.t -> Vector3.t
      method divideScalar: float -> Vector3.t
      method dot: Vector3.t -> float
      method equals: Vector3.t -> bool
      method floor: unit -> Vector3.t
      (* method fromArray: *)
      (* method fromBufferAttribute: *)
      method getComponent: int -> float
      method length: unit -> float
      method manhattanLength: unit -> float
      method lengthSq: unit -> float
      method lerp: Vector3.t -> float -> Vector3.t
      method lerpVectors: Vector3.t -> Vector3.t -> float -> Vector3.t
      method max: Vector3.t -> Vector3.t
      method min: Vector3.t -> Vector3.t
      method multiply: Vector3.t -> Vector3.t
      method multiplyScalar: float -> Vector3.t
      method multiplyVectors: Vector3.t -> Vector3.t -> Vector3.t
      method negate: unit -> Vector3.t
      method normalize: unit -> Vector3.t
      (* method project: Camera.t -> Vector3.t *)
      (* method projectOnPlane: Camera.t -> Vector3.t *)
      method projectOnVector: Vector3.t -> Vector3.t
      method reflect: Vector3.t -> Vector3.t
      method round: unit -> Vector3.t
      method roundToZero: unit -> Vector3.t
      method set: float -> float -> float -> Vector3.t
      method setComponent: int -> float -> unit
      (* method setFromCylindrical *)
      (* method setFromCylindricalCoords *)
      (* method setFromCylindrical  *)
      (* method setFromCylindrical  *)
      (* method setFromCylindrical  *)
      method setLength: float -> Vector3.t
      method setScalar: float -> Vector3.t
      method setX: float -> Vector3.t
      method setY: float -> Vector3.t
      method setZ: float -> Vector3.t
      method sub: Vector3.t -> Vector3.t
      method subScalar: float -> Vector3.t
      method subVectors: Vector3.t -> Vector3.t -> Vector3.t
                                                     (* toArray *)
                                                     (* transformDirection *)
      (* method unproject: Camera.t -> Vector3.t *)
    end [@bs]
  type t = _vector3 Js.t
  external make: float -> float -> float -> Vector3.t = "Vector3" [@@bs.new] [@@bs.module "three"]
end = Vector3

module rec Object3D:
sig
  class type _object3d =
    object
      (* method children: Object3D.t Js.List *)
      method castShadow: bool [@@bs.set]
      (* method children *)
      method rotation: Euler.t [@@bs.set]
      method id: int
      (*  ... *)
      method name: string [@@bs.set]
      method position: Vector3.t [@@bs.set]
      (* used by lookAt method *)
      method up: Vector3.t
      method rotation: Euler.t [@@bs.set]
      method uuid: string
      method visible: bool

      method clone: bool -> Object3D.t
      method copy: Object3D.t -> bool -> Object3D.t

      (* TODO: nullable? *)
      method getObjectById: int -> Object3D.t
      (* TODO: nullable? *)
      method getObjectByName: string -> Object3D.t
      (* TODO: nullable? *)
      method getObjectByProperty: string -> float -> Object3D.t
      method getWorldPosition: Vector3.t -> Vector3.t
      (* method getWorldQuaternion: *)
      method getWorldDirection: Vector3.t -> Vector3.t
      method localToWorld: Vector3.t -> Vector3.t
      method lookAt: Vector3.t -> unit
      (* method raycast *)
      method rotateX: float -> Object3D.t
      method rotateY: float -> Object3D.t
      method rotateZ: float -> Object3D.t
      (* toJSON *)

      method translateX: float -> Object3D.t
      method translateY: float -> Object3D.t
      method translateZ: float -> Object3D.t
      (*...*)
      method updateMatrix: unit -> unit
      method updateMatrixWorld: bool -> unit
      method worldToLocal: Vector3.t -> Vector3.t
           
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
      method aspect: float [@@bs.set]
      method updateProjectionMatrix: unit -> unit
      (* method zoom: float [@@bs.set] [@@bs.get] *)
    end [@bs]
  type t = _camera Js.t
  module Perspective:
  sig
    external make : ?fov:float ->
                    ?aspect:float ->
                    ?near:float ->
                    far:float ->
                    t = "PerspectiveCamera" [@@bs.new] [@@bs.module "three"]
  end
end = Camera

module rec Texture:
sig
  class type _texture =
    object
      method repeat: Vector2.t
      method needsUpdate: bool [@@bs.set]
                               (* TODO: add repeat set *)
    end [@bs]
  type t = _texture Js.t
  external make: Dom.Element.t -> t = "Texture" [@@bs.new] [@@bs.module "three"]
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

module rec Float32Array:
sig
  class type _Float32Array =
    object
    end [@bs]
  type t = _Float32Array Js.t
  external make: float Js.Array.t -> t = "Float32Array" [@@bs.new]
end = Float32Array

module rec Geometry:
sig
  class type _Geometry =
    object
      method vertices: Vector3.t Js.Array.t [@@bs.get]
    end [@bs]
  type t = _Geometry Js.t
  (* no buffer *)
  module Box:
  sig
    external make: float ->
                   float ->
                   float ->
                   t = "BoxGeometry" [@@bs.new] [@@bs.module "three"]
  end

  module Plane:
  sig
    external make: (*width*) float ->
                   (*height*) float ->
                   ?widthSegments:int ->
                   ?heightSegments: int ->
                   unit ->
                   t = "PlaneGeometry" [@@bs.new] [@@bs.module "three"]
  end

  module Cylinder:
  sig
    external make: ?radiusTop:float ->
                   ?radiusBottom:float ->
                   ?height:float ->
                   ?radialSegments:int ->
                   ?heightSegments:int ->
                   ?openEnded:bool ->
                   ?thetaStart:float ->
                   ?thetaLength:float ->
                   unit ->
                   t = "CylinderGeometry" [@@bs.new] [@@bs.module "three"]
  end
  external make: unit -> t = "Geometry" [@@bs.new] [@@bs.module "three"]

  module rec BufferGeometry:
  sig
    (* class type _BufferGeometry =
     *   object
     *     method addAttribute: string -> BufferAttribute.t
     *   end [@bs]
     * type t = _Geometry Js.t *)
    (* TODO: BufferGeometry does not have vertices method (not ) *)
    module Box:
    sig
      external make: float -> float -> float -> t = "BoxBufferGeometry" [@@bs.new] [@@bs.module "three"]
    end

    module Plane:
    sig
      external make: (*width*) float -> (*height*) float -> ?widthSegments:int -> ?heightSegments: int -> unit -> t = "PlaneBufferGeometry" [@@bs.new] [@@bs.module "three"]
    end

    module Cylinder:
    sig
      external make: ?radiusTop:float -> ?radiusBottom:float -> ?height:float -> ?radialSegments:int -> ?heightSegments:int -> ?openEnded:bool -> ?thetaStart:float -> ?thetaLength:float -> unit -> t = "CylinderBufferGeometry" [@@bs.new] [@@bs.module "three"]
    end

    external make: unit -> t = "BufferGeometry" [@@bs.new] [@@bs.module "three"]
  end
end = Geometry

module rec Material:
sig
  type t
  module MeshBasic:
  sig
    type param = {
        color: int [@bs.optional];
        map: Texture.t [@bs.optional];
      } [@@bs.deriving abstract]
    external make: param -> t = "MeshBasicMaterial" [@@bs.new] [@@bs.module "three"]
  end
  module MeshPhongMaterial:
  sig
    type param = {
        color: int [@bs.optional];
        map: Texture.t [@bs.optional];
      } [@@bs.deriving abstract]
    external make: param -> t = "MeshPhongMaterial" [@@bs.new] [@@bs.module "three"]
  end
  module LineBasic:
  sig
    type param = {
        color: int [@bs.optional];
        linewidth: float [@bs.optional];
      } [@@bs.deriving abstract]
    external make: param -> t = "LineBasicMaterial" [@@bs.new] [@@bs.module "three"]
  end
  module LineDashed:
  sig
    type param = {
        color: int [@bs.optional];
        linewidth: float [@bs.optional];
        scale: float [@bs.optional];
        dashSize: float [@bs.optional];
        gapSize: float  [@bs.optional];
    } [@@bs.deriving abstract]
    external make: param -> t = "LineDashedMaterial" [@@bs.new] [@@bs.module "three"]
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
      method geometry: Geometry.t
      method material: Material.t
                         (* method updateMorphTargets: unit -> unit *)
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
      method autoUpdate: bool [@@bs.set]
                              (*method background*)
      method environment: Texture.t [@@bs.set]
                                    (* method fog: *)
      method overrideMaterial: Material.t [@@bs.set]
      method dispose: unit -> unit
      (* method toJSON *)
    end [@bs]
  type t = _scene Js.t
  external make: unit -> Scene.t = "Scene" [@@bs.new] [@@bs.module "three"]
  external add: t -> Mesh.t -> unit = "" [@@bs.send]
end = Scene

module rec WebGLRenderer:
sig
  class type _webGLRenderer =
    object
      method setPixelRatio: float -> unit
      method domElement: Dom.Element.t
      method render: Scene.t -> Camera.t -> unit
      (* color -> alpha *)
      method setClearColor: int -> float -> unit
      method autoClear: bool
      method autoClearColor: bool
      method autoClearDepth: bool
      method autoClearStencil: bool
                                 (* ... *)
      method domElement: Dom.Element.t

      method gammaFactor: float

      method getClearAlpha: unit -> float
      (* method getClearColor: unit -> Color.t *)
      method dispose: unit -> unit
      method setSize: int -> int -> bool -> unit
    end [@bs]
  type t = _webGLRenderer Js.t
  type param = {
      canvas: Dom.Element.t [@bs.optional];
      (* context *)
      (* precision *)
      premultipliedAlpha: bool [@bs.optional];
      alpha: bool [@bs.optional];
      antialias: bool [@bs.optional];
      stencil: bool [@bs.optional];
      preserveDrawingBuffer: bool [@bs.optional];
      (* powerPreference *)
      failIfMajorPerformanceCaveat: bool [@bs.optional];
      depth: bool [@bs.optional];
      (* logarithmicDepthBuffer *)
    } [@@bs.deriving abstract]
  external make: param -> t = "WebGLRenderer" [@@bs.new] [@@bs.module "three"]
end = WebGLRenderer

(* *)
module rec OrbitControls:
sig
  class type _orbitcontrols =
    object
      method target: Vector3.t
      method update: unit -> unit
      method rotateSpeed: float [@@bs.set]
      method zoomSpeed: float [@@bs.set]
      method panSpeed: float [@@bs.set]
      method enableZoom: bool [@@bs.set]
      method enabled: bool [@@bs.set]
    end [@bs]
  type t = _orbitcontrols Js.t
  (* returns constructor *)
  external make: Camera.t -> Dom.Element.t -> t = "three-orbitcontrols" [@@bs.new] [@@bs.module]
end = OrbitControls

(* WebVR *)
module rec WebVRPolyfill:
sig
  class type _webvrpolyfill =
    object
    end [@bs]
  type t = _webvrpolyfill Js.t
  (* returns constructor *)
  external make: unit -> t = "webvr-polyfill" [@@bs.new] [@@bs.module]
end = WebVRPolyfill

(* StereoEffect *)
module rec StereoEffect:
sig
  class type _stereoeffect =
    object
      method setSize: float -> float -> unit
    end [@bs]
  type t = _stereoeffect Js.t
  (* returns constructor *)
  external make: WebGLRenderer.t -> t = "three-stereo-effect" [@@bs.new] [@@bs.module]
end = StereoEffect

module rec Light:
sig
  class type _Light =
    object
      inherit Object3D._object3d
    end [@bs]
  type t = _Light Js.t
  module Ambient:
   sig
    external make: ?color:int -> ?intensity:float -> unit -> t = "AmbientLight" [@@bs.new] [@@bs.module "three"]
   end
end = Light

module rec GLTFExporter:
sig
  class type _gltfexporter =
    object
      method parse: Scene.t -> (Js.Json.t -> unit) -> unit
    end [@bs]
  type t = _gltfexporter Js.t
  external make: unit -> t = "three-gltf-exporter" [@@bs.new] [@@bs.module]
end = GLTFExporter

       
(* not tested *)
(* module rec DeviceOrientationControls:
 * sig
 *   class type _deviceorientationcontrols =
 *     object
 *       method connect: unit -> unit
 *       method update: unit -> unit
 *     end [@bs]
 *   type t = _deviceorientationcontrols Js.t
 *   (\* returns constructor *\)
 *   external make: Camera.t -> bool -> t = "dummy_new" [@@bs.new] [@@bs.module "three-controls-deviceorientation"]
 * end = DeviceOrientationControls *)

(* not tested *)
(* module rec StereoEffect:
 * sig
 *   class type _stereoeffect =
 *     object
 *       method setSize: int -> int -> unit
 *     end [@bs]
 *   type t = _stereoeffect Js.t
 *   (\* TODO: Render.t *\)
 *   external make: WebGLRenderer.t -> t = "StereoEffect" [@@bs.new] [@@bs.module "three-stereo-effect"]
 * end = StereoEffect *)
