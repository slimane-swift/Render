//
//  Render.swift
//  Render
//
//  Created by Yuki Takei on 4/20/16.
//
//


@_exported import C7
@_exported import S4
@_exported import AsyncResponderConvertible
@_exported import Renderable
import Foundation

#if os(Linux)
let currentDirectoryPath = NSFileManager.defaultManager().currentDirectoryPath
#else
let currentDirectoryPath = NSFileManager.default().currentDirectoryPath
#endif

public struct Render: AsyncResponderConvertible {
    let engine: Renderable
    let path: String
    let viewPath: String

    public init(engine: Renderable, viewPath: String = currentDirectoryPath + "/views", path: String){
        self.engine = engine
        self.viewPath = viewPath
        self.path = path
    }

    public func respond(_ response: Response, result: ((Void) throws -> Response) -> Void){
        engine.render(viewPath + "/" + path) { f in
            var response = response
            result {
                let data = try f()
                response.body = .buffer(data)
                return response
            }
        }
    }
}
