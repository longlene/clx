# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://github.com/meh/ruby-tesseract-ocr"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/call-me-0"
ruby_add_rdepend ">=dev-ruby/iso639-0" # package name modified
ruby_add_rdepend ">=dev-ruby/ffi-extra-0"
ruby_add_rdepend ">=dev-ruby/ffi-inline-0"

