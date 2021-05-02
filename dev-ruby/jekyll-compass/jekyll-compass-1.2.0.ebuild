# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    This project is a plugin for the Jekyll static website generator to allow for using Compass projects with your
    Jekyll website"
HOMEPAGE="https://github.com/mscharley/jekyll-compass"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/compass-1.0"
ruby_add_rdepend ">=dev-ruby/jekyll-2.0"

