# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby interface to YUI Compressor for minifying JavaScript and CSS assets"
HOMEPAGE="http://github.com/sstephenson/ruby-yui-compressor/"

LICENSE="MIT BSD-3-clause MPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


