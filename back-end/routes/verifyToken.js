const jwt = require("jsonwebtoken") 

const verifyToken = (req, res, next) => {
    const authToken = req.headers.token
    if(authToken) { 
        const token = authToken.split(' ')[1]
        jwt.verify(token, process.env.JWT_SEC, (err, user)=> {
            if(err) {
                res.status(403).json('Token is not valid')
            } else {
                req.user = user
                next()
            }
        })

    } else {
        res.status(401).json('You are not authenticated !')
    }
}

const verifyTokenAndAuthor = (req, res, next) => {
    verifyToken(req, res, ()=> {
        if(req.user.id === req.params.id || req.user.isAdmin || req.user.id === req.params.userId) {
            next()
        } else {
            res.status(403).json('You are not alowed to do that !')
        }
    })
}

const verifyTokenAndAdmin = (req, res, next) => {
    verifyToken(req, res, ()=> {
        if(req.user.isAdmin) {
            next()
        } else {
            res.status(403).json('You are not alowed to do that !')
        }
    })
}

 module.exports =  { verifyToken, verifyTokenAndAuthor, verifyTokenAndAdmin }