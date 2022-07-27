//
//  ViewController.swift
//  TestProjectPosts
//
//  Created by macbook on 25.07.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var postsModel: PostsModel?
    var postModel: PostModel?
//    var postsArray: [PostCellData] = postsModel.posts
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "detailVC"{
            if let vc = segue.destination as? DetailViewController {
                let post = sender as? PostModel
                print(post ?? "nil")
                vc.postModel = post
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.isUserInteractionEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        

        
        let urlStringPosts = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        
        guard let url = URL(string: urlStringPosts) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
//            let jsonString = String(data: data, encoding: .utf8)
//            if let jsonString = jsonString {
//            print(jsonString)
//            }
            do{
                self.postsModel = try JSONDecoder().decode(PostsModel.self, from: data)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                print(self.postsModel?.posts.first?.postId ?? "")
            }catch{
               print(error)
            }
        }.resume()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postsModel?.posts.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCollectionViewCell
        let post = postsModel?.posts[indexPath.row]
        cell.setupCell(postsModel: post!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = postsModel?.posts[indexPath.row]
        self.performSegue(withIdentifier: "detailVC", sender: post)
    }
   

}

