//
//  NotesListVC.swift
//  FunlifeNotes
//
//  Created by Admin on 7/28/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit
import PopupDialog

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
        note2.isPrivate = true
        note2.colorItem = .green
        var note3 = NotesObj()
        note3.colorItem = .red
        var note4 = NotesObj()
        note4.isPrivate = true
        note4.isReminder = true
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
        if listNotes[indexPath.row].isOpenDetail == true {
            return 207
        }
        return 130
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if listNotes[indexPath.row].isOpenDetail == true {
            return 207
        }
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: NotesListCell = tableView.dequeueReusableCell(withIdentifier: "NotesListCell", for: indexPath) as? NotesListCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.noteObj = listNotes[indexPath.row]
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? NotesListCell {
            UIView.animate(withDuration: 0.3, animations: {
                cell.contentView.transform = CGAffineTransform.init(scaleX: 1.01, y: 1.01)
            }) { (true) in
                cell.contentView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }
            delay(seconds: 0.1, completion: {
                self.listNotes[indexPath.row].isOpenDetail = !self.listNotes[indexPath.row].isOpenDetail
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let more = UITableViewRowAction(style: .destructive, title: "More", handler: { action , indexPath in
            print("More Click SuccessFully")
        })
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete", handler: { action , indexPath in
            print("Delete Click SuccessFully")
        })
        
        return [more,delete]
    }
}

extension NotesListVC: NotesListCellDelegate {
  
    func setActionFromCell(type: TypeMenuCellNoteList, indexPath: IndexPath) {
        switch type {
        case .watch:
            let vc = NotesDetailVC.fromStoryboard(DETAIL_STORYBOARD)
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: false, completion: nil)
            break
        case .edit:
            break
        case .delete:
            deleteNote(indexPath: indexPath)
            break
        case .security:
            break
        }
    }
    
    func deleteNote(indexPath: IndexPath){
        let dialog = PopupDialog(title: "Are you delete this Note ??", message: "You will remove this note fom your device", image: nil, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true, hideStatusBar: true, completion: nil)
        
        let buttonOne = CancelButton(title: "CANCEL") {
            
        }
        let buttonTwo = DefaultButton(title: "DELETE", dismissOnTap: true) {
            self.listNotes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
        }
        dialog.addButtons([buttonOne, buttonTwo])
        self.present(dialog, animated: true, completion: nil)
    }
}
