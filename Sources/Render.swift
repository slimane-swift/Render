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

public struct Render: AsyncResponderConvertible {
    let engine: Renderable
    
    let path: String
    
    let viewPath: String

    public init(engine: Renderable, viewPath: String = FileManager.default.currentDirectoryPath + "/views", path: String){
        self.engine = engine
        self.viewPath = viewPath
        self.path = path
    }

    public func respond(_ response: Response, result: @escaping ((Void) throws -> Response) -> Void){
        engine.render(viewPath + "/" + path) { getData in
            var response = response
            result {
                response.body = .buffer(try getData())
                return response
            }
        }
    }
}
