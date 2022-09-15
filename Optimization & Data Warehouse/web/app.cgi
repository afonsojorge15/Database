#!/usr/bin/python3

from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request, redirect, url_for

## Libs postgres
import psycopg2
import psycopg2.extras

app = Flask(__name__)

## SGBD configs
DB_HOST="db.tecnico.ulisboa.pt"
DB_USER="ist193692"
DB_DATABASE=DB_USER
DB_PASSWORD="lica"
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD)


## Runs the function once the root page is requested.
## The request comes with the folder structure setting ~/web as the root

@app.route('/')
def menu():
  try:
    return render_template("menu.html")
  except Exception as e:
    return str(e)

@app.route('/voltar')
def voltar():
  try:
    return redirect(url_for('menu'))
  except Exception as e:
    return str(e)


@app.route('/medicos')
def list_medicos():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT * FROM medico order by num_cedula;"
    cursor.execute(query)
    return render_template("medico.html", cursor=cursor)
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    dbConn.close()

@app.route('/remover_medico')
def remove_medico():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "DELETE FROM medico where num_cedula = %s;"
    aux = (request.args.get("num_cedula"))
    cursor.execute(query, aux)
    return redirect(url_for('list_medicos'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/editar_nome_medico')
def nome_medico():
  try:
    return render_template("medico_nome.html", params = request.args)
  except Exception as e:
    return str(e)

@app.route('/update_nome_medico', methods=["POST"])
def update_nome_medico():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "update medico set nome = %s where num_cedula = %s;"
    aux = (request.form["nome"], request.form["num_cedula"])
    cursor.execute(query, aux)
    return redirect(url_for('list_medicos'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/editar_especialidade_medico')
def especialidade_medico():
  try:
    return render_template("medico_especialidade.html", params = request.args)
  except Exception as e:
    return str(e)

@app.route('/update_especialidade_medico', methods=["POST"])
def update_especialidade_medico():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "update medico set especialidade = %s where num_cedula = %s;"
    aux = (request.form["especialidade"], request.form["num_cedula"])
    cursor.execute(query, aux)
    return redirect(url_for('list_medicos'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/inserir_medico_aux')
def inserir_medico_aux():
  try:
    return render_template("inserir_medico.html")
  except Exception as e:
    return str(e)

@app.route('/inserir_medico', methods=["POST"])
def inserir_medico():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "insert into medico values(%s, %s, %s);"
    aux = (request.form["num_cedula"], request.form["nome"] , request.form["especialidade"])
    cursor.execute(query, aux)
    return redirect(url_for('list_medicos'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/instituicoes')
def list_instituicoes():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT * FROM instituicao order by tipo, num_regiao;"
    cursor.execute(query)
    return render_template("instituicao.html", cursor=cursor)
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    dbConn.close()

@app.route('/remover_instituicao')
def remover_instituicao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = f'''delete from instituicao where nome = '{request.args.get("nome")}';'''
    cursor.execute(query)
    return redirect(url_for('list_instituicoes'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/editar_tipo_instituicao')
def editar_tipo_instituicao():
  try:
    return render_template("instituicao_tipo.html", params = request.args)
  except Exception as e:
    return str(e)

@app.route('/update_tipo_instituicao', methods=["POST"])
def update_tipo_instituicao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "update instituicao set tipo = %s where nome = %s;"
    aux = (request.form["tipo"], request.form["nome"])
    cursor.execute(query, aux)
    return redirect(url_for('list_instituicoes'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/editar_num_regiao_instituicao')
def editar_num_regiao_instituicao():
  try:
    return render_template("instituicao_num_regiao.html", params = request.args)
  except Exception as e:
    return str(e)

@app.route('/update_num_regiao_instituicao', methods=["POST"])
def update_num_regiao_instituicao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "select num_regiao from concelho where num_concelho = %s;"
    aux = request.form["num_concelho"]
    cursor.execute(query, aux)
    regiao = cursor.fetchone()[0]
    query = "update instituicao set num_concelho = %s, num_regiao = %s where nome = %s;"
    aux2 = (request.form["num_concelho"], regiao, request.form["nome"])
    cursor.execute(query, aux2)
    return redirect(url_for('list_instituicoes'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/inserir_instituicao_aux')
def inserir_instituicao_aux():
  try:
    return render_template("inserir_instituicao.html")
  except Exception as e:
    return str(e)

@app.route('/inserir_instituicao', methods=["POST"])
def inserir_instituicao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "insert into instituicao values(%s, %s, %s, %s);"
    aux =(request.form["nome"], request.form["tipo"], request.form["num_regiao"], request.form["num_concelho"])
    cursor.execute(query, aux)
    return redirect(url_for('list_instituicoes'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/prescricoes')
def list_prescricoes():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT * FROM prescricao order by data;"
    cursor.execute(query)
    return render_template("prescricao.html", cursor=cursor)
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    dbConn.close()

@app.route('/remover_prescricao')
def remover_prescricao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "DELETE FROM prescricao where (num_cedula = %s and num_doente = %s and data = %s);"
    aux = (request.args.get("num_cedula"), request.args.get("num_doente"), request.args.get("data"))
    cursor.execute(query, aux)
    return redirect(url_for('list_prescricoes'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/editar_quant_prescricao')
def editar_quant_prescricao():
  try:
    return render_template("quant_prescricao.html", params = request.args)
  except Exception as e:
    return str(e)

@app.route('/update_quant_prescricao', methods=["POST"])
def update_quant_prescricao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "update prescricao set quant = %s where (num_cedula = %s and num_doente = %s and data = %s);"
    aux = (request.form["quant"], request.form["num_cedula"], request.form["num_doente"], request.form["data"] )
    cursor.execute(query, aux)
    return redirect(url_for('list_prescricoes'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/inserir_prescricao_aux')
def inserir_prescricao_aux():
  try:
    return render_template("inserir_prescricao.html")
  except Exception as e:
    return str(e)

@app.route('/inserir_prescricao', methods=["POST"])
def inserir_prescricao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "insert into prescricao values(%s, %s, %s, %s, %s);"
    aux = (request.form["num_cedula"], request.form["num_doente"], request.form["data"], request.form["substancia"], request.form["quant"])
    cursor.execute(query, aux)
    return redirect(url_for('list_prescricoes'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/analises')
def list_analises():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT * FROM analise order by num_analise;"
    cursor.execute(query)
    return render_template("analise.html", cursor=cursor)
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    dbConn.close()

@app.route('/remover_analise')
def remover_analise():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "DELETE FROM analise where num_analise = %s;"
    aux = (request.args.get("num_analise"))
    cursor.execute(query, aux)
    return redirect(url_for('list_analises'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/editar_analise')
def editar_analise():
  try:
    return render_template("editar_analise.html", params = request.args)
  except Exception as e:
    return str(e)

@app.route('/update_analise', methods=["POST"])
def update_analise():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = f'''select especialidade, num_cedula, num_doente, data, data_registo, nome, quant, inst from analise where num_analise = {request.form["num_analise"]};'''
    cursor.execute(query)

    array = cursor.fetchone()

    if request.form["especialidade"]:
      especialidade = request.form["especialidade"]
    else:
      especialidade = array[0]

    if request.form["num_cedula"]:
      num_cedula = request.form["num_cedula"]
    else:
      num_cedula = array[1]

    if request.form["num_doente"]:
      num_doente = request.form["num_doente"]
    else:
      num_doente = array[2]

    if request.form["data"]:
      data = request.form["data"]
    else:
      data = array[3]

    if request.form["data_registo"]:
      data_registo = request.form["data_registo"]
    else:
      data_registo = array[4]

    if request.form["nome"]:
      nome = request.form["nome"]
    else:
      nome = array[5]

    if request.form["quant"]:
      quant = request.form["quant"]
    else:
      quant = array[6]

    if request.form["inst"]:
      inst = request.form["inst"]
    else:
      inst = array[7]

    query = f'''update analise set especialidade = '{especialidade}', num_cedula = {num_cedula}, num_doente = {num_doente}, data = '{data}', data_registo = '{data_registo}', nome = '{nome}', quant = {quant}, inst = '{inst}' where num_analise = {request.form["num_analise"]};'''
    cursor.execute(query)

    return redirect(url_for('list_analises'))

  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()


@app.route('/inserir_analise_aux')
def inserir_analise_aux():
  try:
    return render_template("inserir_analise.html")
  except Exception as e:
    return str(e)

@app.route('/inserir_analise', methods=["POST"])
def inserir_analise():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)

    if request.form["num_cedula"] and request.form["num_doente"] and request.form["data"]:
      query = "insert into analise values(%s, %s, %s, %s, %s, %s,  %s, %s, %s);"
      aux = (request.form["num_analise"], request.form["especialidade"], request.form["num_cedula"], request.form["num_doente"], request.form["data"], request.form["data_registo"], request.form["nome"], request.form["quant"], request.form["inst"])
    else:
      query = "insert into analise values(%s, %s, null, null, null, %s,  %s, %s, %s);"
      aux = (request.form["num_analise"],request.form["especialidade"],request.form["data_registo"],request.form["nome"],request.form["quant"],request.form["inst"])
    cursor.execute(query,aux)
    return redirect(url_for('list_analises'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/venda_farmacia')
def list_venda_farmacia():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT * FROM venda_farmacia order by num_venda;"
    cursor.execute(query)
    return render_template("venda_farmacia.html", cursor=cursor)
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    dbConn.close()


@app.route('/adicionar_venda_farmacia_prescricao_aux')
def adicionar_venda_farmacia_prescricao_aux():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "select max(num_venda) from venda_farmacia;"
    cursor.execute(query)
    num_venda = cursor.fetchone()[0] + 1
    return render_template("venda_farmacia_prescricao.html", params=request.args, num_venda=num_venda)
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/adicionar_venda_farmacia_prescricao', methods=["POST"])
def adicionar_venda_farmacia_prescricao():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "insert into venda_farmacia values(%s, %s, %s, %s, %s, %s);"
    aux = (request.form["num_venda"],request.form["data_registo"],request.form["substancia"],request.form["quant"],request.form["preco"],request.form["inst"])
    cursor.execute(query,aux)
    if request.form["flag"] == "1":
      query = "insert into prescricao_venda values(%s, %s, %s, %s, %s);"
      aux = (request.form["num_cedula"],request.form["num_doente"],request.form["data"],request.form["substancia"],request.form["num_venda"])
      cursor.execute(query,aux)
    return redirect(url_for('list_venda_farmacia'))
  except Exception as e:
    return str(e)
  finally:
    dbConn.commit()
    cursor.close()
    dbConn.close()

@app.route('/venda_farmacia_no_prescription')
def venda_farmacia_no_prescription():
  try:
    return render_template("venda_farmacia_no_prescription.html")
  except Exception as e:
    return str(e)

@app.route('/prescricao_venda')
def list_prescricao_venda():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT * FROM prescricao_venda order by num_venda;"
    cursor.execute(query)
    return render_template("prescricao_venda.html", cursor=cursor)
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    dbConn.close()

@app.route('/substancias_num_dado_mes_aux')
def substancias_num_dado_mes_aux():
  try:
    return render_template("substancias_num_dado_mes.html", params=request.args)
  except Exception as e:
    return str(e)

@app.route('/substancias_num_dado_mes', methods=["POST"])
def substancias_num_dado_mes():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "select substancia from medico natural join prescricao where (num_cedula = %s and extract(MONTH from data) = %s);"
    aux = (request.form["num_cedula"],request.form["mes"])
    cursor.execute(query,aux)
    return render_template("tabela_substancias.html", cursor=cursor, num_cedula=request.form["num_cedula"], mes=request.form["mes"])
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    dbConn.close()

@app.route('/nivel_glicemia')
def list_nivel_glicemia():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT quant, num_doente, num_concelho num_con FROM analise  inner join instituicao inst1 on inst = inst1.nome where analise.nome = 'glicemia' group by num_concelho, num_doente, quant having quant = (SELECT max(quant) FROM analise inner join instituicao on inst = instituicao.nome where analise.nome = 'glicemia' and num_concelho = inst1.num_concelho);"
    cursor.execute(query)
    cursor1 = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    query = "SELECT quant, num_doente, num_concelho num_con FROM analise  inner join instituicao inst1 on inst = inst1.nome where analise.nome = 'glicemia' group by num_concelho, num_doente, quant having quant = (SELECT min(quant) FROM analise inner join instituicao on inst = instituicao.nome where analise.nome = 'glicemia' and num_concelho = inst1.num_concelho);"
    cursor1.execute(query)
    return render_template("nivel_glicemia.html", cursor=cursor, cursor1=cursor1)
  except Exception as e:
    return str(e)
  finally:
    cursor.close()
    cursor1.close()
    dbConn.close()

CGIHandler().run(app)
