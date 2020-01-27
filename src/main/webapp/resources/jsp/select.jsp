<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <style>
        .select-menu {
            --background: #242836;
            --text: #fff;
            --icon: #fff;
            --icon-active: #3F4656;
            --list: #1C212E;
            --list-text: rgba(255, 255, 255, .2);
            --list-text-hover: rgba(255, 255, 255, .5);
            position: relative;
    		z-index: 99999999999999;
            font-weight: 500;
            font-size: 14px;
            line-height: 25px;
    		display: inline-block;
        }

        .select-menu select,
        .select-menu .button {
            font-family: inherit;
            margin: 0;
            border: 0;
            text-align: left;
            text-transform: none;
            -webkit-appearance: none;
        }

        .select-menu select {
            pointer-events: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            opacity: 0;
            padding: 8px 36px 8px 12px;
            visibility: hidden;
            font-weight: 500;
            font-size: 14px;
            line-height: 25px;
        }

        .select-menu ul {
            margin: 0;
            padding: 0;
            list-style: none;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            -webkit-transform: translateY(var(--t));
            transform: translateY(var(--t));
            -webkit-transition: opacity 0.3s ease, -webkit-transform 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
            transition: opacity 0.3s ease, -webkit-transform 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
            transition: opacity 0.3s ease, transform 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
            transition: opacity 0.3s ease, transform 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1), -webkit-transform 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
        }

        .select-menu ul li {
            padding: 8px 36px 8px 12px;
            cursor: pointer;
        }

        .select-menu>ul {
            background: var(--list);
            color: var(--list-text);
            border-radius: 6px;
        }

        .select-menu>ul li {
            -webkit-transition: color .3s ease;
            transition: color .3s ease;
        }

        .select-menu>ul li:hover {
            color: var(--list-text-hover);
        }

        .select-menu .button {
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            padding: 0;
            z-index: 1;
            width: 100%;
            display: block;
            overflow: hidden;
            border-radius: 6px;
            color: var(--text);
            background: var(--background);
        }

        .select-menu .button em {
            --r: 45deg;
            display: block;
            position: absolute;
            right: 12px;
            top: 0;
            width: 7px;
            height: 7px;
            margin-top: 13px;
            -webkit-backface-visibility: hidden;
        }

        .select-menu .button em:before,
        .select-menu .button em:after {
            --o: .4;
            content: '';
            width: 7px;
            height: 7px;
            opacity: var(--o);
            display: block;
            position: relative;
            -webkit-transition: opacity .2s ease;
            transition: opacity .2s ease;
            -webkit-transform: rotate(var(--r)) scale(0.75);
            transform: rotate(var(--r)) scale(0.75);
        }

        .select-menu .button em:before {
            border-left: 2px solid var(--icon);
            border-top: 2px solid var(--icon);
            top: 1px;
        }

        .select-menu .button em:after {
            border-right: 2px solid var(--icon);
            border-bottom: 2px solid var(--icon);
            bottom: 1px;
        }

        .select-menu:not(.open)>ul {
            opacity: 0;
            pointer-events: none;
        }

        .select-menu.open.tilt-up {
            -webkit-animation: tilt-up .4s linear forwards;
            animation: tilt-up .4s linear forwards;
        }

        .select-menu.open.tilt-up .button em:before {
            --o: 1;
        }

        .select-menu.open.tilt-down {
            -webkit-animation: tilt-down .4s linear forwards;
            animation: tilt-down .4s linear forwards;
        }

        .select-menu.open.tilt-down .button em:after {
            --o: 1;
        }

        @-webkit-keyframes tilt-up {

            40%,
            60% {
                -webkit-transform: perspective(500px) rotateX(8deg);
                transform: perspective(500px) rotateX(8deg);
            }
        }

        @keyframes tilt-up {

            40%,
            60% {
                -webkit-transform: perspective(500px) rotateX(8deg);
                transform: perspective(500px) rotateX(8deg);
            }
        }

        @-webkit-keyframes tilt-down {

            40%,
            60% {
                -webkit-transform: perspective(500px) rotateX(-8deg);
                transform: perspective(500px) rotateX(-8deg);
            }
        }

        @keyframes tilt-down {

            40%,
            60% {
                -webkit-transform: perspective(500px) rotateX(-8deg);
                transform: perspective(500px) rotateX(-8deg);
            }
        }

    </style>

    <script>
	$(function() {
        $('select[data-menu]').each(function () {

            let select = $(this),
                options = select.find('option'),
                menu = $('<div />').addClass('select-menu'),
                button = $('<div />').addClass('button'),
                list = $('<ul />'),
                arrow = $('<em />').prependTo(button);

            options.each(function (i) {
                let option = $(this);
                list.append($('<li />').text(option.text()));
            });

            menu.css('--t', select.find(':selected').index() * -41 + 'px');

            select.wrap(menu);

            button.append(list).insertAfter(select);

            list.clone().insertAfter(button);

        });

        $(document).on('click', '.select-menu', function (e) {

            let menu = $(this);

            if (!menu.hasClass('open')) {
                menu.addClass('open');
            }

        });

        $(document).on('click', '.select-menu > ul > li', function (e) {

            let li = $(this),
                menu = li.parent().parent(),
                select = menu.children('select'),
                selected = select.find('option:selected'),
                index = li.index();

            menu.css('--t', index * -41 + 'px');
            selected.attr('selected', false);
            select.find('option').eq(index).attr('selected', true);

            menu.addClass(index > selected.index() ? 'tilt-down' : 'tilt-up');

            setTimeout(() => {
                menu.removeClass('open tilt-up tilt-down');
            }, 500);

        });

        $(document).click(e => {
        	
            e.stopPropagation();
            if ($('.select-menu').has(e.target).length === 0) {
                $('.select-menu').removeClass('open');
            }
        })
	});
    </script>