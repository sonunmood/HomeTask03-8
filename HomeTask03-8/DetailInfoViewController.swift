import UIKit

class DetailInfoViewController: UIViewController {
    
    var image: UIImage?
    var name: String?
    var number: String?
    
    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 24.0
        image.clipsToBounds = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 48)
        
        return nameLabel
    }()
    
    private let mobileLabel: UILabel = {
        let mobileLbl = UILabel()
        mobileLbl.text = "Mobile"
        return mobileLbl
    }()
    
    private let numberLabel: UILabel = {
        let numberLbl = UILabel()
        numberLbl.textColor = .tintColor
        return numberLbl
    }()
    
    private let imageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let massageImage: UIImageView = {
        let massegeIV = UIImageView()
        massegeIV.image = UIImage(systemName: "ellipsis.message.fill")
        return massegeIV
    }()
    
    let callImage: UIImageView = {
        let callImage = UIImageView()
        callImage.image = UIImage(systemName: "phone.circle")
        return callImage
    }()
    let faceTimeImage: UIImageView = {
        let faceTimeImage = UIImageView()
        faceTimeImage.image = UIImage(systemName: "video.fill")
        return faceTimeImage
    }()
    
    let mailImage: UIImageView = {
        let mailImage = UIImageView()
        mailImage.image = UIImage(systemName: "house")
        return mailImage
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
        profileImage.image = image
        nameLabel.text = name
        numberLabel.text = number
    
        
        
    }
    
    func initUI () {
        view.backgroundColor = .white
        view.addSubview(profileImage)
        view.addSubview(nameLabel)
        view.addSubview(numberLabel)
        view.addSubview(mobileLabel)
        view.addSubview(imageView)
        imageView.addSubview(massageImage)
        imageView.addSubview(callImage)
        imageView.addSubview(faceTimeImage)
        imageView.addSubview(mailImage)
        
        
        
        
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(180)
            make.height.width.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(profileImage)
            make.top.equalTo(profileImage.snp.bottom).offset(16)
        }
        
        mobileLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(16)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(mobileLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(64)
        }
        
        massageImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(64)
            make.height.width.equalTo(32
            )
        }
        
        callImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(massageImage.snp.trailing).offset(40)
            make.height.width.equalTo(32
            )
        }
        
        faceTimeImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(mailImage.snp.leading).offset(-40)
            make.height.width.equalTo(32
            )
        }
        
        mailImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-64)
            make.height.width.equalTo(32)
        }
    }
}
