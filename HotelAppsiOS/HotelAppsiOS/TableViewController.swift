//
//  TableViewController.swift
//  HotelAppsiOS
//
//  Created by Gw on 17/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var nhSelected:String?
    var alaSelected:String?
    var rateSelected:String?
    var fasiSelected:String?
    var loterSelected:String?
    var rate2Selected:String?
    // deklarasi variable task sebagai object
    var tasks : [Task] = [] //Task ini dipanggil dari eniti yang sudah dibuat tadi
    
    //deklarasi context untuk persintent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting height table view
        tableView.estimatedRowHeight = 650.0
        tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! TableViewCell
        
        //deklarasi dataTask sebagai index dari tasks
        let dataTasks = tasks[indexPath.row]
        //mengambil data dengan atributs name_task
        if let myDataTask = dataTasks.nh {
            //menampilkan data ke label
            cell.labelnh.text = myDataTask
        }
        if let myDataTask1 = dataTasks.ala {
            //menampilkan data ke label
            cell.labeljl.text = myDataTask1
        }
        if let myDataTask2 = dataTasks.rate {
            //menampilkan data ke label
            cell.labelrate.text = myDataTask2
        }
        if let myDataTask3 = dataTasks.rate2 {
            //menampilkan data ke label
            cell.labelrate2.text = myDataTask3
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = tasks[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        nhSelected = dataTask.nh
        alaSelected = dataTask.ala
        rateSelected = dataTask.rate
        fasiSelected = dataTask.fasi
        loterSelected = dataTask.loter
        rate2Selected = dataTask.rate2
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke ViewController
            let sendData = segue.destination as! ViewController
            sendData.passnh = nhSelected
            sendData.passala = alaSelected
            sendData.passrate = rateSelected
            sendData.passfasi = fasiSelected
            sendData.passloter = loterSelected
            sendData.passrate2 = rate2Selected
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method data()
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do {
            //kalau tidak ada, maka request downlad data
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            //kondisi apabila eror fetch data
            print("Fetching Failed")
        }
    }
    
    //menambahkan data untuk delete data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //mengecek menu swipe apabila editing stylenya delete
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate) . saveContext()
            do {
                //retreive data
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
}
