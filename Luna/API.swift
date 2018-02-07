//  This file was automatically generated and should not be edited.

import Apollo

public final class FeedQuery: GraphQLQuery {
  public static let operationString =
    "query Feed($limit: Int!, $offset: Int!) {\n  feed(limit: $limit, offset: $offset) {\n    __typename\n    id\n    name\n    address {\n      __typename\n      description\n    }\n    avatar {\n      __typename\n      path\n      tags {\n        __typename\n        id\n        name\n      }\n    }\n    photos {\n      __typename\n      id\n      path\n      tags {\n        __typename\n        id\n        name\n      }\n    }\n    stars\n    signs {\n      __typename\n      id\n      name\n      description\n      icon\n    }\n  }\n}"

  public var limit: Int
  public var offset: Int

  public init(limit: Int, offset: Int) {
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQuery"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("feed", arguments: ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Feed.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(feed: [Feed]) {
      self.init(snapshot: ["__typename": "RootQuery", "feed": feed.map { $0.snapshot }])
    }

    /// feed
    public var feed: [Feed] {
      get {
        return (snapshot["feed"] as! [Snapshot]).map { Feed(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "feed")
      }
    }

    public struct Feed: GraphQLSelectionSet {
      public static let possibleTypes = ["Master"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("address", type: .nonNull(.object(Address.selections))),
        GraphQLField("avatar", type: .nonNull(.object(Avatar.selections))),
        GraphQLField("photos", type: .nonNull(.list(.nonNull(.object(Photo.selections))))),
        GraphQLField("stars", type: .nonNull(.scalar(Double.self))),
        GraphQLField("signs", type: .nonNull(.list(.nonNull(.object(Sign.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, address: Address, avatar: Avatar, photos: [Photo], stars: Double, signs: [Sign]) {
        self.init(snapshot: ["__typename": "Master", "id": id, "name": name, "address": address.snapshot, "avatar": avatar.snapshot, "photos": photos.map { $0.snapshot }, "stars": stars, "signs": signs.map { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var address: Address {
        get {
          return Address(snapshot: snapshot["address"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "address")
        }
      }

      public var avatar: Avatar {
        get {
          return Avatar(snapshot: snapshot["avatar"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "avatar")
        }
      }

      public var photos: [Photo] {
        get {
          return (snapshot["photos"] as! [Snapshot]).map { Photo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "photos")
        }
      }

      public var stars: Double {
        get {
          return snapshot["stars"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "stars")
        }
      }

      public var signs: [Sign] {
        get {
          return (snapshot["signs"] as! [Snapshot]).map { Sign(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "signs")
        }
      }

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes = ["Address"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(description: String) {
          self.init(snapshot: ["__typename": "Address", "description": description])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct Avatar: GraphQLSelectionSet {
        public static let possibleTypes = ["Photo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("path", type: .nonNull(.scalar(String.self))),
          GraphQLField("tags", type: .nonNull(.list(.nonNull(.object(Tag.selections))))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(path: String, tags: [Tag]) {
          self.init(snapshot: ["__typename": "Photo", "path": path, "tags": tags.map { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var path: String {
          get {
            return snapshot["path"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "path")
          }
        }

        public var tags: [Tag] {
          get {
            return (snapshot["tags"] as! [Snapshot]).map { Tag(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "tags")
          }
        }

        public struct Tag: GraphQLSelectionSet {
          public static let possibleTypes = ["Tag"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String) {
            self.init(snapshot: ["__typename": "Tag", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes = ["Photo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("path", type: .nonNull(.scalar(String.self))),
          GraphQLField("tags", type: .nonNull(.list(.nonNull(.object(Tag.selections))))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, path: String, tags: [Tag]) {
          self.init(snapshot: ["__typename": "Photo", "id": id, "path": path, "tags": tags.map { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var path: String {
          get {
            return snapshot["path"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "path")
          }
        }

        public var tags: [Tag] {
          get {
            return (snapshot["tags"] as! [Snapshot]).map { Tag(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "tags")
          }
        }

        public struct Tag: GraphQLSelectionSet {
          public static let possibleTypes = ["Tag"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String) {
            self.init(snapshot: ["__typename": "Tag", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct Sign: GraphQLSelectionSet {
        public static let possibleTypes = ["Sign"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("icon", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, description: String, icon: String) {
          self.init(snapshot: ["__typename": "Sign", "id": id, "name": name, "description": description, "icon": icon])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var description: String {
          get {
            return snapshot["description"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        public var icon: String {
          get {
            return snapshot["icon"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "icon")
          }
        }
      }
    }
  }
}