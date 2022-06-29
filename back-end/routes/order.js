const router = require('express').Router()
const Order = require("../models/Order")
const { verifyToken, verifyTokenAndAuthor, verifyTokenAndAdmin } = require('./verifyToken.js')


// Create
router.post('/create', verifyToken, async (req, res) => {
    const newOrder = new Order(req.body)
    
    try {
        const savedOrder = await newOrder.save()
        res.status(200).json(savedOrder)
    }
    catch(err) {
        res.status(500).json(err)
    }
})

//UPDATE Order
router.put('/:id', verifyTokenAndAdmin, async (req, res) => {

    try {
        const updatedOrder = await Order.findByIdAndUpdate(req.params.id, {
            $set: req.body
        }, { new: true })

        res.status(200).json(updatedOrder)

    } catch (err) {
        res.status(500).json(err)
    }
})

// DELETE Product
router.delete('/:id', verifyTokenAndAdmin, async(req, res) => {
    try {
        await Order.findByIdAndDelete(req.params.id)
        res.status(200).json('Order has been deleted')
    } catch(err) {
        res.status(500).json(err)
    }
})

// GET Order by userId
router.get('/find/:userId', verifyTokenAndAuthor, async (req, res) => {
    try {
       const orders = await Order.find({ userId: req.params.userId })
       res.status(200).json(orders)

    } catch(err) {
        res.status(500).json(err)
    }
})

// GET All Order
router.get('/', verifyTokenAndAdmin, async (req, res) => {
    try {
        const orders = await Order.find()
        res.status(200).json(orders)

    } catch(err) {
        res.status(500).json(err)
    }
})

// GET stats order
router.get('/income', verifyTokenAndAdmin, async (req, res) => {
    const productId = req.query.productId
    const date = new Date()
    const lastMonth = new Date(date.setMonth(date.getMonth() - 1))
    const previousMonth = new Date(new Date().setMonth(lastMonth.getMonth() - 1))

    try {
       const data = await Order.aggregate([
            // lay ra nhung ngay tao lon hon previousMonth    
           { $match : { 
            createdAt: { $gte: previousMonth },
            ...(productId && {
                products: { $elemMatch: { productId: productId }}
            })
            }
        
        },

           {    
               // lay ra thang trong createdAt va gan vao bien month
               $project: {
                   month: { $month: "$createdAt" },
                   sales: "$amount"
               }
           },

           {
               // group lai thang va dem tong so luong da dki trong thang 
               $group: {
                   _id: "$month",
                   total: { $sum: "$sales" }
               }
           }
       ])
       res.status(200).json(data)

    } catch(err) {
        res.status(500).json(err)
    }
})

module.exports = router