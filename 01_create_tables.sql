--1 users Table

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    hash_password TEXT,
    role VARCHAR(20) NOT NULL DEFAULT 'customer',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT users_role_check
        CHECK (role IN ('customer', 'admin'))
);

-- 2 categories Table

CREATE TABLE categories (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 3 products Table

CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,

    category_id BIGINT NOT NULL,

    name VARCHAR(200) NOT NULL,

    description TEXT,

    price NUMERIC(10,2) NOT NULL,

    quantity_stock INTEGER NOT NULL DEFAULT 0,

    sku VARCHAR(50) NOT NULL UNIQUE,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT products_category_fk
        FOREIGN KEY (category_id)
        REFERENCES categories(id),

    CONSTRAINT products_price_check
        CHECK (price > 0),

    CONSTRAINT products_stock_check
        CHECK (quantity_stock >= 0)
);

-- 4 orders Table.

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,

    user_id BIGINT NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'pending',

    total_amount NUMERIC(10,2) NOT NULL DEFAULT 0,

    shipping_address TEXT NOT NULL,

    notes TEXT,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT orders_user_fk
        FOREIGN KEY (user_id)
        REFERENCES users(id),

    CONSTRAINT orders_status_check
        CHECK (
            status IN (
                'pending',
                'confirmed',
                'processing',
                'shipped',
                'delivered',
                'cancelled'
            )
        ),

    CONSTRAINT orders_total_check
        CHECK (total_amount >= 0)
);

-- 5 items_order Table.

CREATE TABLE items_order (
    id BIGSERIAL PRIMARY KEY,

    order_id BIGINT NOT NULL,

    product_id BIGINT NOT NULL,

    quantity INTEGER NOT NULL,

    price_unit NUMERIC(10,2) NOT NULL,

    subtotal NUMERIC(10,2) NOT NULL,

    CONSTRAINT items_order_order_fk
        FOREIGN KEY (order_id)
        REFERENCES orders(id),

    CONSTRAINT items_order_product_fk
        FOREIGN KEY (product_id)
        REFERENCES products(id),

    CONSTRAINT items_order_quantity_check
        CHECK (quantity > 0),

    CONSTRAINT items_order_price_check
        CHECK (price_unit > 0),

    CONSTRAINT items_order_unique_product
        UNIQUE (order_id, product_id)
);

-- 6 payments Table.

CREATE TABLE payments (
    id BIGSERIAL PRIMARY KEY,

    order_id BIGINT NOT NULL UNIQUE,

    payment_method VARCHAR(20) NOT NULL,

    payment_status VARCHAR(20) NOT NULL DEFAULT 'pending',

    amount NUMERIC(10,2) NOT NULL,

    transaction_reference VARCHAR(100),

    paid_at TIMESTAMP,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT payments_order_fk
        FOREIGN KEY (order_id)
        REFERENCES orders(id),

    CONSTRAINT payments_method_check
        CHECK (
            payment_method IN (
                'cash',
                'card',
                'bank_transfer',
                'wallet'
            )
        ),

    CONSTRAINT payments_status_check
        CHECK (
            payment_status IN (
                'pending',
                'paid',
                'failed',
                'refunded'
            )
        ),

    CONSTRAINT payments_amount_check
        CHECK (amount > 0)
);

