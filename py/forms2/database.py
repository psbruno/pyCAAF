import mysql.connector as connector
from datetime import datetime
from PyQt5 import QtWidgets
import json


def connect():
    try:
        db = connector.connect(
            host="localhost",
            user="root",
            password="password",
            db="caaf"
        )
        return db
    except connector.Error as err:
        QtWidgets.QMessageBox.information(None, "ERRO", "Não foi possível conectar ao banco de dados.\n" + str(err))
        return None


def get_id_caixa(cursor, cod_caixa):
    try:
        cursor.execute("SELECT idcaixa FROM caixa WHERE cod_caixa = '{}'".format(cod_caixa))
        idcaixa = cursor.fetchone()[0]
        if idcaixa is None:
            QtWidgets.QMessageBox.information(None, "ERRO", "Caixa não localizada!.\n")
            return None
        return idcaixa
    except TypeError:
        QtWidgets.QMessageBox.information(None, "ERRO", "Ocorreu um erro ao consultar dados sobre o caso. "
                                                        "Por favor, Verifique o campo 'CÓDIGO DO CASO'\n")
        return None


def insert_conjunto_dados(cursor, id_conjunto, id_caixa, json_data, tabela):
    try:
        cursor.execute(
            "INSERT INTO conjunto_dados(id_conjunto, id_caixa, input) VALUES ({}, {}, '{}')".format(id_conjunto,
                                                                                                    id_caixa, json_data)
        )
        return True
    except connector.Error as err:
        QtWidgets.QMessageBox.information(None, "ERRO", "Não foi possível inserir dados de " + tabela + ".\n" + str(err))
        raise


def insert_outros(cursor, estado_conservacao="None", efeitos_tafonomicos="None", cabelo="None", tecido_mole="None", insetos="None",
                  reconstrucao_craniana="None", outras_construcoes="None", amostras="None", restos="None", elementos="None", idcaixa=-100,
                  obs="None", possui_restos=0, restos_nmi=0, quais_restos="None"):
    try:
        cursor.execute(
            "INSERT INTO outros(estado_conservacao, efeitos_tafonomicos, cabelo, tecido_mole, insetos, "
            "reconstrucao_craniana, outras_construcoes, amostras, restos, elementos, idcaixa, obs, possui_restos, "
            "restos_nmi, quais_restos) "
            "VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', {}, '{}', {}, {}, '{}')"
                .format(estado_conservacao, efeitos_tafonomicos, cabelo, tecido_mole, insetos,
                        reconstrucao_craniana,
                        outras_construcoes, amostras, restos, elementos, idcaixa, obs, possui_restos, restos_nmi,
                        quais_restos)
        )
        return True
    except connector.Error as err:
        QtWidgets.QMessageBox.information(None, "ERRO", "Não foi possível inserir dados referentes a: Estado de conservação, efeitos tafonômicos, cabelo, ..., Observações.\n" + str(err))
        raise


def insert_identificacao(cursor, nome_perito, data, id_caixa):
    try:
        data_formatada = datetime.strptime(data, "%m/%d/%Y").date()
        cursor.execute(
            "INSERT INTO identificacao(nome_perito, data, caixa_idcaixa) VALUES ('{}', '{}', {})"
                .format(nome_perito, data_formatada, id_caixa)
        )
        return True
    except connector.Error as err:
        QtWidgets.QMessageBox.information(None, "ERRO", "Não foi possível inserir dados sobre a Equipe envolvida e Data\n" + str(err))
        raise


def get_json(tabela):
    dict_data = {}
    row_data = []
    column_data = []

    for row in range(tabela.rowCount()):
        it = tabela.verticalHeaderItem(row)
        row_data.append(str(row + 1) if it is None else it.text())
        dict_data[row_data[-1]] = {}
        for column in range(tabela.columnCount()):
            it = tabela.horizontalHeaderItem(column)
            if it is None:
                column_data.append(str(column + 1))
            else:
                column_data.append(it.text())
                try:
                    dict_data[row_data[-1]][column_data[-1]] = tabela.item(row, column).text()
                except AttributeError:
                    dict_data[row_data[-1]][column_data[-1]] = ""
    return json.dumps(dict_data, ensure_ascii=False)


def get_json_with_repeated_headers(tabela, num_repeated_headers):
    dict_data = {}
    row_data = []
    column_data = []

    for c in range(tabela.rowCount()):
        it = tabela.verticalHeaderItem(c)
        row_data.append(str(c + 1) if it is None else it.text())
        dict_data[row_data[-1]] = {}
        for b in range(tabela.columnCount()):
            it = tabela.horizontalHeaderItem(b)
            if it is None:
                column_data.append(str(b + 1))
            else:
                column_data.append(it.text())
                column = column_data[-1] if b < num_repeated_headers else column_data[-1] + " secundario"
                try:
                    dict_data[row_data[-1]][column] = tabela.item(c, b).text()
                except AttributeError:
                    dict_data[row_data[-1]][column] = ""
    return json.dumps(dict_data, ensure_ascii=False)
