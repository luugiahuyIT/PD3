const router = require('express').Router()
const Cart = require("../models/Cart")
const { verifyToken, verifyTokenAndAuthor, verifyTokenAndAdmin } = require('./verifyToken.js')


// Create
router.post('/create', verifyToken, async (req, res) => {
    const newCart = new Cart(req.body)
    
    try {
        const savedCart = await newCart.save()
        res.status(200).json(savedCart)
    }
    catch(err) {
        res.status(500).json(err)
    }
})

//UPDATE Cart
router.put('/:id', verifyTokenAndAuthor, async (req, res) => {

    try {
        const updatedCart = await Cart.findByIdAndUpdate(req.params.id, {
            $set: req.body
        }, { new: true })

        res.status(200).json(updatedCart)

    } catch (err) {
        res.status(500).json(err)
    }
})

// DELETE Cart
router.delete('/:id', verifyTokenAndAuthor, async(req, res) => {
    try {
        await Cart.findByIdAndDelete(req.params.id)
        res.status(200).json('Cart has been deleted')
    } catch(err) {
        res.status(500).json(err)
    }
})

// GET Cart by userId
router.get('/find/:userId', verifyTokenAndAuthor, async (req, res) => {
    try {
       const cart = await Cart.findOne({userId: req.params.userId})
       res.status(200).json(cart)

    } catch(err) {
        res.status(500).json(err)
    }
})

// // GET All Cart
router.get('/', verifyTokenAndAdmin, async (req, res) => {
    try {
        const carts = await Cart.find()
        res.status(200).json(carts)

    } catch(err) {
        res.status(500).json(err)
    }
})

module.exports = router