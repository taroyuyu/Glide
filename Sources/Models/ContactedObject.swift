//
//  ContactedObject.swift
//  glide
//
//  Copyright (c) 2019 cocoatoucher user on github.com (https://github.com/cocoatoucher/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

/// Value that indicates different types of objects that was involed in a contact
/// or collision.
public enum ContactedObject: Equatable {
    
    /// Other object is collider component of another entity.
    case collider(ColliderComponent)
    /// Other object is a collider tile.
    case colliderTile(isEmptyTile: Bool)
    /// Other object is a slope collider tile.
    case slope(SlopeContext)
    
    public static func == (lhs: ContactedObject, rhs: ContactedObject) -> Bool {
        switch (lhs, rhs) {
        case let (.collider(lhsCollider), .collider(rhsCollider)):
            return lhsCollider === rhsCollider
        case let (.colliderTile(isLhsEmpty), .colliderTile(isRhsEmpty)):
            return isLhsEmpty == isRhsEmpty
        case let (.slope(lhsSlopeContext), .slope(rhsSlopeContext)):
            return lhsSlopeContext == rhsSlopeContext
        default:
            return false
        }
    }
    
    /// Returns collider component of the other object if the other object is an entity.
    public var colliderComponent: ColliderComponent? {
        switch self {
        case let .collider(collider):
            return collider
        default:
            return nil
        }
    }
}
