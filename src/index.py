from .config import app
from flask import Flask, flash, request, redirect, render_template, url_for
from .subset_sum import subset_sum


@app.route('/',methods=['GET'])
def index():
    return render_template('/index.html')


@app.route('/', methods=['POST'])
def cal_sum():
    data = request.form.to_dict()
    list_of_nums = data['list_of_numbers']
    sum_num = float(data['sum_num'])
    if ',' in list_of_nums:
        list_of_nums = list_of_nums.split(',')
    elif ' ' in list_of_nums:
        list_of_nums = list_of_nums.split(' ')
    else:
        list_of_nums = list_of_nums.split('\n')
    msg = subset_sum(list_of_nums, sum_num)
    if msg:
        flash(msg)

    return render_template('/index.html')

