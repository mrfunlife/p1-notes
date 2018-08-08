//
//  NotesListVC.swift
//  FunlifeNotes
//
//  Created by Admin on 7/28/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

class NotesListVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var listNotes: [NotesObj] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        fakeData()
    }
    
    
    func fakeData() {
        var note1 = NotesObj()
        note1.colorItem = .blue
        var note2 = NotesObj()
        note2.colorItem = .green
        var note3 = NotesObj()
        note3.colorItem = .red
        var note4 = NotesObj()
        note4.colorItem = .orange
        var note5 = NotesObj()
        note5.colorItem = .orange
        var note6 = NotesObj()
        note6.colorItem = .green
        var note7 = NotesObj()
        note7.colorItem = .red
        var note8 = NotesObj()
        note8.colorItem = .red
        
        listNotes = [note1,note2,note3,note4,note5,note6,note7,note8]
        
    }

    func initTableView(){
        tableView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0)
        tableView.register(UINib.init(nibName: "NotesListCell", bundle: nil), forCellReuseIdentifier: "NotesListCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: NotesListCell = tableView.dequeueReusableCell(withIdentifier: "NotesListCell", for: indexPath) as? NotesListCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.noteObj = listNotes[indexPath.row]
        return cell
    }

}
