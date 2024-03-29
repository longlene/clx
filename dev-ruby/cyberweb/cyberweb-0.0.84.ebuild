# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    This is a web framework called Cyberweb, of medium size (about
    ~220kb including the documentation)"
HOMEPAGE="http://rubygems.org/gems/cyberweb"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/url_action-0"
ruby_add_rdepend ">=dev-ruby/colours-0"
ruby_add_rdepend ">=dev-ruby/html_colours-0"
ruby_add_rdepend ">=dev-ruby/save_file-0"
ruby_add_rdepend ">=dev-ruby/environment_information-0"
ruby_add_rdepend ">=dev-ruby/hardware_information-0"
ruby_add_rdepend ">=dev-ruby/html_tags-0"
ruby_add_rdepend ">=dev-ruby/return_date-0"
ruby_add_rdepend ">=dev-ruby/web_images-0"
ruby_add_rdepend ">=dev-ruby/remove_html-0"
ruby_add_rdepend ">=dev-ruby/new_tags-0"
ruby_add_rdepend ">=dev-ruby/kramdown-0"
ruby_add_rdepend ">=dev-ruby/coderay-0"

